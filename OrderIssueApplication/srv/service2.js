const cds = require('@sap/cds');
const axios = require('axios');

module.exports = cds.service.impl(async function () {

    const { Issues, IssueComments } = this.entities;
    const { SELECT, INSERT, UPDATE } = cds.ql;


    this.on('ApproverComment', async (req) => {
        debugger
        const issueId = req.data.IssueID;
 
        console.log("Issue ID:", issueId);
 
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
    const auth = Buffer.from(client + ':' + secret).toString('base64');

    const tokenResponse = await axios.post(
        'https://edbd777dtrial.authentication.us10.hana.ondemand.com/oauth/token?grant_type=client_credentials',
        null,
        { headers: { Authorization: 'Basic ' + auth } }
    );

    await axios.post(
        'https://spa-api-gateway-bpi-us-prod.cfapps.us10.hana.ondemand.com/unified/v1/triggers/api/us10.edbd777dtrial.approverapplication.st',
        {
            "executionId":executionId,
            "inputs": { "status":req.data.status }
        },
        {
            headers: {
                Authorization: 'Bearer ' + tokenResponse.data.access_token,
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
