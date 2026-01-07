sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"approverlevels/test/integration/pages/ApproverLevelsList",
	"approverlevels/test/integration/pages/ApproverLevelsObjectPage"
], function (JourneyRunner, ApproverLevelsList, ApproverLevelsObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('approverlevels') + '/test/flp.html#app-preview',
        pages: {
			onTheApproverLevelsList: ApproverLevelsList,
			onTheApproverLevelsObjectPage: ApproverLevelsObjectPage
        },
        async: true
    });

    return runner;
});

