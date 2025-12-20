sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"project1/test/integration/pages/OwnersList",
	"project1/test/integration/pages/OwnersObjectPage",
	"project1/test/integration/pages/PetsObjectPage"
], function (JourneyRunner, OwnersList, OwnersObjectPage, PetsObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('project1') + '/test/flp.html#app-preview',
        pages: {
			onTheOwnersList: OwnersList,
			onTheOwnersObjectPage: OwnersObjectPage,
			onThePetsObjectPage: PetsObjectPage
        },
        async: true
    });

    return runner;
});

