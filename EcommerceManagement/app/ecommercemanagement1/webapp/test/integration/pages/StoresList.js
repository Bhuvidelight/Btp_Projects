sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ListReport(
        {
            appId: 'ecommercemanagement1',
            componentId: 'StoresList',
            contextPath: '/Stores'
        },
        CustomPageDefinitions
    );
});