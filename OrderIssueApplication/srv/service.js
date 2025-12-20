const cds = require("@sap/cds");

module.exports = cds.service.impl(function () {

    const { Customers, Orders } = this.entities;

    // ---- Issues ----
    this.before("CREATE", Customers.drafts, (req) => {
        const random = Math.floor(1000 + Math.random() * 9000);
        req.data.CustomerID = `C${random}`;
    });

    // ---- Issue Comments ----
    this.before("CREATE", Orders.drafts, (req) => {
     const random = Math.floor(1000 + Math.random() * 9000);
        req.data.OrderID = `O${random}`;
    });
         

    });