module.exports = async function () {
    this.on ('total', async function (req) {
        debugger;
        console.log("req", req)
        var custid = req.data.cId;
        console.log("custid", custid); 
        let orders = await SELECT ('Order') .where ({cId : custid});
        console.log('orders', orders)
    })
}
