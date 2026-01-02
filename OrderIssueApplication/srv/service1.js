const cds = require("@sap/cds");
const axios = require('axios');
const { INSERT } = require("@sap/cds/lib/ql/cds-ql");


module.exports = cds.service.impl(function () {

    const { Issues } = this.entities;

    // ---- Issues ----
    this.before("CREATE", Issues.drafts, (req) => {
        const random = Math.floor(1000 + Math.random() * 9000);
        req.data.IssueID = `I${random}`;
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
            var bodyy = JSON.parse(JSON.stringify({

                "definitionId": "us10.edbd777dtrial.approverapplication.approveIssues",
                "context": {
                    "level": 1,
                    "totalLevels": 2,
                }

            }));
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
