sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"ecommercemanagement/test/integration/pages/CustomersList",
	"ecommercemanagement/test/integration/pages/CustomersObjectPage",
	"ecommercemanagement/test/integration/pages/OrderObjectPage"
], function (JourneyRunner, CustomersList, CustomersObjectPage, OrderObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('ecommercemanagement') + '/test/flp.html#app-preview',
        pages: {
			onTheCustomersList: CustomersList,
			onTheCustomersObjectPage: CustomersObjectPage,
			onTheOrderObjectPage: OrderObjectPage
        },
        async: true
    });

    return runner;
});

