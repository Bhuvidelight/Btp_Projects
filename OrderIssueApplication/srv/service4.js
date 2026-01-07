const cds = require('@sap/cds');
const { SELECT } = require('@sap/cds/lib/ql/cds-ql');
 
 
module.exports = cds.service.impl(function (srv) {
 
 
   const { ApproverLevels } = this.entities;
   this.before('CREATE', ApproverLevels.drafts, (req) => {
        debugger;
       
        const id = Date.now();
        req.data.approverId = `A${id}`;
       
 
        console.log('draft Generated Approver is:', req.data.approverId);
    });
    });