const cds = require('@sap/cds');
const axios = require('axios');
const ApproverDetails = require('./service4');

module.exports = cds.service.impl(async function () {

    const { Issues, IssueComments } = this.entities;
    const { ApprovalHistory, ApproverLevels } = this.entities;

    const { SELECT, INSERT, UPDATE } = cds.ql;


    this.on('ApproverComment', async (req) => {
        debugger
        const issueId = req.data.IssueID;


        console.log("Issue ID:", issueId);
        const issue = await SELECT.one
            .from('Issues')
            .columns('OrderID')
            .where({ IssueID: issueId });

        if (!issue || !issue.OrderID) {
            throw new Error("OrderID not found for IssueID " + issueId);
        }

        const orderId = issue.OrderID;


        // 1️⃣ SELECT workflow instance id from Issue table
        const result = await cds.run(
            SELECT.one
                .from('Issues')
                .columns('InstanceId')
                .where({ IssueID: issueId })
        );


        if (!result || !result.InstanceId) {
            throw new Error("Workflow instance ID not found for issue " + issueId);
        }

        const executionId = result.InstanceId;
        console.log("Execution ID:", executionId);
        try {
            console.log("process trigger");
            const client = 'sb-1a79e5f8-32d4-436a-a157-6e46dd1eb8ae!b556420|xsuaa!b49390';
            const secret = '290c6676-e88e-45f6-ab29-10addaf085ab$IyWSdPKIAHgGD1sxaIlQVbaaPB30BGR6qBJtYMh_7cQ=';
            const auth1 = Buffer
                .from(client + ':' + secret, 'utf-8')
                .toString('base64');

            const response1 = await axios.request(
                'https://edbd777dtrial.authentication.us10.hana.ondemand.com/oauth/token?grant_type=client_credentials',
                {
                    method: 'POST',
                    headers: {
                        Authorization: 'Basic ' + auth1
                    }
                }
            );
            var presentresponse = await axios.get(`https://spa-api-gateway-bpi-us-prod.cfapps.us10.hana.ondemand.com/workflow/rest/v1/workflow-instances/${executionId}/context`,
                {
                    headers: {
                        'Authorization': 'Bearer ' + response1.data.access_token,
                        "Content-Type": "application/json"

                    }
                });
            console.log("Response Body:", presentresponse.data.custom.currentlevel);
            const currentLevel =
                Number(presentresponse.data.custom.currentlevel);

            console.log("Current Level:", currentLevel);

            const alreadyApproved = await SELECT.one
                .from(ApprovalHistory)
                .where({
                    IssueID: issueId,
                    OrderID: orderId,
                    Approvallevel: currentLevel,
                    Status: 'APPROVED'
                });

            if (alreadyApproved) {
                return "Already approved";
            }

            debugger
            const historyRow = await SELECT.one
                .from(ApprovalHistory)
                .where({
                    IssueID: issueId,
                    OrderID: orderId,
                    Approvallevel: currentLevel
                });

            if (!historyRow) {
                // 🔹 Row not yet created → skip daysTaken calculation
                console.log(`ApprovalHistory row missing for level ${currentLevel}`);
            }
            const actionAt = new Date();
            let daysTaken = null;
            if (historyRow && historyRow.ActionAt) {
                const start = new Date(historyRow.ActionAt);
                daysTaken = Math.max(
                    1, Math.ceil((actionAt - start) / (1000 * 60 * 60 * 24))
                );
            }

            await UPDATE(ApprovalHistory)
                .set({
                    Status: 'APPROVED',
                    ActionAt: actionAt,
                    DaysTaken: daysTaken
                })
                .where({
                    IssueID: issueId,
                    OrderID: orderId,
                    Approvallevel: currentLevel
                });
            debugger

            const nextLevel = currentLevel + 1;

            const nextLevelApprovers = await SELECT
                .from(ApproverLevels)
                .columns('ApproverName', 'ApproverEmail')
                .where({ Approvallevel: nextLevel });

            for (const a of nextLevelApprovers) {

                const exists = await SELECT.one
                    .from(ApprovalHistory)
                    .where({
                        IssueID: issueId,
                        OrderID: orderId,
                        Approvallevel: nextLevel,
                        ApproverEmail: a.ApproverEmail
                    });

                if (!exists) {
                    await INSERT.into(ApprovalHistory).entries({
                        IssueID: issueId,
                        OrderID: orderId,
                        Approvallevel: nextLevel,
                        ApproverName: a.ApproverName,
                        ApproverEmail: a.ApproverEmail,
                        Status: 'PENDING',
                        ActionAt: null,
                        DaysTaken: null
                    });
                }
            }
            const approver = await cds.run(
                SELECT.one
                    .from('ApproverLevels')
                    .columns('ApproverName', 'ApproverEmail')
                    .where({ Approvallevel: currentLevel })
            );

            if (!approver) {
                throw new Error(`No approver found for level ${currentLevel}`);
            }

            const bodyy = {
                executionId: executionId,
                inputs: {
                    status: "Approved",
                    _name: approver.ApproverName,
                    email: approver.ApproverEmail,
                    clevel: currentLevel,
                    nextLevel: currentLevel + 1
                }
            };

            console.log(bodyy);
            console.log("Workflow custom object:", presentresponse.data.custom);
            console.log("Resolved currentLevel:", currentLevel);

            await axios.post(
                'https://spa-api-gateway-bpi-us-prod.cfapps.us10.hana.ondemand.com/unified/v1/triggers/api/us10.edbd777dtrial.approverapplication.st',
                bodyy,
                {
                    headers: {
                        'Authorization': 'Bearer ' + response1.data.access_token,
                        'irpa-api-key': 'IHRG64qltYiyItvHMtaHROK-ALMWkrev'
                    }
                }
            );

            const { Issues } = this.entities;

            await UPDATE(Issues)
                .set({
                    status: req.data.status
                })
                .where({ IssueID: issueId });
        } catch (error) {
            console.log(error)
        }
        return "success";
    })
    

});
