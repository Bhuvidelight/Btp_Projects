const cds = require("@sap/cds");

module.exports = srv => {

    srv.on("TotalSum", async (req) => {
        const { cId } = req.data;

        const db = cds.transaction(req);

        // read all order IDs for this customer
        const orders = await db.run(
            SELECT.from("EcommerceManagement.Order").columns("oId").where({ cId })
        );

        if (!orders.length) return 0;

        const orderIds = orders.map(o => o.oId);

        // read payments for those orders
        const payments = await db.run(
            SELECT.from("EcommerceManagement.Payment").columns("amount").where({ oId: { in: orderIds } })
        );

        let total = 0;
        payments.forEach(p => total += p.amount);

        return total;
    });

};
