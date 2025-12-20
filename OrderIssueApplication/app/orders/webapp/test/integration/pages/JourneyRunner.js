sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"orders/test/integration/pages/OrdersList",
	"orders/test/integration/pages/OrdersObjectPage",
	"orders/test/integration/pages/IssuesObjectPage"
], function (JourneyRunner, OrdersList, OrdersObjectPage, IssuesObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('orders') + '/test/flp.html#app-preview',
        pages: {
			onTheOrdersList: OrdersList,
			onTheOrdersObjectPage: OrdersObjectPage,
			onTheIssuesObjectPage: IssuesObjectPage
        },
        async: true
    });

    return runner;
});

