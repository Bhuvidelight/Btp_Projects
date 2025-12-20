sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"ecommercemanagement1/test/integration/pages/StoresList",
	"ecommercemanagement1/test/integration/pages/StoresObjectPage",
	"ecommercemanagement1/test/integration/pages/ProductsObjectPage"
], function (JourneyRunner, StoresList, StoresObjectPage, ProductsObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('ecommercemanagement1') + '/test/flp.html#app-preview',
        pages: {
			onTheStoresList: StoresList,
			onTheStoresObjectPage: StoresObjectPage,
			onTheProductsObjectPage: ProductsObjectPage
        },
        async: true
    });

    return runner;
});

