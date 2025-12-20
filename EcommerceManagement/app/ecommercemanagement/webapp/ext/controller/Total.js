// sap.ui.define([
//     "sap/m/MessageBox"
// ], function (MessageBox) {
//     'use strict'; 

//     return {

//         onTotalSum: function () {
//             debugger
//             const orders=sap.ui.core.Element.getElementById("ecommercemanagement::CustomersObjectPage--fe::table::CustomerstoOrders::LineItem::Orders-innerTable").getItems();
//         console.log(orders);
//         let sum=0;
//         for(let order of orders)
//         {
//                 let value=order.getBindingContext().getObject();
//                 console.log(value);
//                 sum+=value.Total;
//         MessageBox.alert("total sum is "+sum);
//         console.log(sum);
//         }}
//     }
// });

sap.ui.define([
    "sap/m/MessageToast"
], function (MessageToast) {
    'use strict';
 
    return {
        onTotalSum: async function (oContext, aSelectedContexts) {
            debugger;
            var url = window.location.href;
            console.log(url);
            const id = url.match(/Customers\((\d+)\)/)[1];
 
            console.log(id);
            
            let oModel = sap.ui.core.Element.getElementById("ecommercemanagement::CustomersObjectPage--fe::ObjectPageDynamicHeaderTitle-_actionsToolbar").getModel();
            let oFunc = oModel.bindContext(`/total(...)`);
            oFunc.setParameter("cId", id)
            await oFunc.execute();
            
        }
    };
});
 