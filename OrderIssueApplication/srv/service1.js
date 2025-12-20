const cds = require("@sap/cds");
const { INSERT } = require("@sap/cds/lib/ql/cds-ql");

module.exports = cds.service.impl(function () {

    const { Issues}  = this.entities;

    // ---- Issues ----
    this.before("CREATE", Issues.drafts, (req) => {
        const random = Math.floor(1000 + Math.random() * 9000);
        req.data.IssueID = `I${random}`;
    });
   
     const {IssueComments } = this.entities;
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

});