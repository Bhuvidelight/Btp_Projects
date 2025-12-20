sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"admin/test/integration/pages/CustomersList",
	"admin/test/integration/pages/CustomersObjectPage",
	"admin/test/integration/pages/OrdersObjectPage"
], function (JourneyRunner, CustomersList, CustomersObjectPage, OrdersObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('admin') + '/test/flp.html#app-preview',
        pages: {
			onTheCustomersList: CustomersList,
			onTheCustomersObjectPage: CustomersObjectPage,
			onTheOrdersObjectPage: OrdersObjectPage
        },
        async: true
    });

    return runner;
});

