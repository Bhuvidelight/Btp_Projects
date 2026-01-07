const cds = require("@sap/cds");
const axios = require('axios');
const { INSERT, SELECT, UPDATE } = require("@sap/cds/lib/ql/cds-ql");


module.exports = cds.service.impl(function () {

    const { Issues, ApproverLevels, ApprovalHistory } = this.entities;

    // ---- Issues ----
    this.before("CREATE", Issues.drafts, (req) => {
        const random = Math.floor(1000 + Math.random() * 9000);
        req.data.IssueID = `I${random}`;
        req.data.status = 'Pending'
    });

    const { IssueComments } = this.entities;
    this.on('addComment', async function (req) {
        debugger;

        const commentData = {
            comment: req.data.comment,
            IssueID: req.data.IssueID
        };

        const result = await INSERT.into(IssueComments).entries(commentData);
        return result;
    });


    this.on('commentsDraft', async function (req) {
        debugger;

        const { uuid } = cds.utils;
        const draftId = uuid();

        // Draft Admin Data
        await INSERT.into('DRAFT.DraftAdministrativeData').entries({
            DraftUUID: draftId,
            CreationDateTime: new Date().toISOString(),
            CreatedByUser: req.user.id,
            LastChangeDateTime: new Date().toISOString(),
            LastChangedByUser: req.user.id,
            InProcessByUser: req.user.id,
            DraftIsCreatedByMe: true,
            DraftIsProcessedByMe: true
        });

        // Draft Comment
        const result = await INSERT.into(IssueComments.drafts).entries({
            comment: req.data.description,
            IssueID: req.data.IssueID,
            DraftAdministrativeData_DraftUUID: draftId
        });

        return result;
    });

    this.on('sendForApproval', async function (req) {
        debugger
        const issueId = req.data.IssueID;

        const issue = await SELECT.one
            .from('Issues')
            .columns('OrderID')
            .where({ IssueID: issueId });

        if (!issue || !issue.OrderID) {
            throw new Error("OrderID not found for IssueID " + issueId);
        }

        const orderId = issue.OrderID;

        try {
            console.log("process trigger");
            var client = 'sb-1a79e5f8-32d4-436a-a157-6e46dd1eb8ae!b556420|xsuaa!b49390';
            var secret = '290c6676-e88e-45f6-ab29-10addaf085ab$IyWSdPKIAHgGD1sxaIlQVbaaPB30BGR6qBJtYMh_7cQ=';
            var auth1 = Buffer.from(client + ':' + secret, 'utf-8').toString('base64');
            var response1 = await axios.request('https://edbd777dtrial.authentication.us10.hana.ondemand.com/oauth/token?grant_type=client_credentials',
                {
                    method: 'POST',
                    headers: {
                        'Authorization': 'Basic ' + auth1
                    }
                });
            console.log(response1);

            const totalApprovers = (await SELECT.from(ApproverLevels).columns('count(*) as total'))[0].total;

            console.log(totalApprovers)

            const totalLevels = await SELECT.one
                .from(ApproverLevels)
                .columns('max(Approvallevel) as HighestLevel');

            console.log(totalLevels.HighestLevel);

            // list of all the approvers in level 1
            const level1Approver = await SELECT.one
                .from(ApproverLevels)
                .where({ Approvallevel: 1 });

            if (!level1Approver) {
                throw new Error("No approver found for level 1");
            }

            const exists = await SELECT.one
                .from(ApprovalHistory)
                .where({
                    IssueID: issueId,
                    OrderID: orderId,
                    Approvallevel: 1
                });

            if (!exists) {
                await INSERT.into(ApprovalHistory).entries({
                    IssueID: issueId,
                    OrderID: orderId,
                    Approvallevel: 1,
                    ApproverName: level1Approver.ApproverName,
                    ApproverEmail: level1Approver.ApproverEmail,
                    Status: 'PENDING',
                    ActionAt: null,
                    DaysTaken: null
                });
            }
            const approverNames = (
                await SELECT.from(ApproverLevels).columns('ApproverName')
            ).map(a => a.ApproverName);

            console.log(approverNames);


            var bodyy = {
                "definitionId": "us10.edbd777dtrial.approverapplication.approveIssues",
                "context": {
                    "level": 1,
                    "totalLevels": totalLevels.HighestLevel,
                    "issueid": issueId,
                    "orderid": orderId,
                    "levelApprovers": approverNames
                }
            }
            console.log(bodyy);
            debugger
            var response11 = await axios.post(`https://spa-api-gateway-bpi-us-prod.cfapps.us10.hana.ondemand.com/workflow/rest/v1/workflow-instances`, bodyy,
                {
                    headers: {
                        'Authorization': 'Bearer ' + response1.data.access_token,
                    }
                });
            debugger
            const InstanceId = response11.data.id;
            console.log(" Instance ID:", InstanceId);


            await cds.run(
                UPDATE('Issues')
                    .set({ InstanceId: InstanceId })
                    .where({ IssueID: req.data.IssueID }));

        } catch (error) {
            console.log(error)
        }

    })
});
