sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"approver/test/integration/pages/IssuesList",
	"approver/test/integration/pages/IssuesObjectPage",
	"approver/test/integration/pages/IssueCommentsObjectPage"
], function (JourneyRunner, IssuesList, IssuesObjectPage, IssueCommentsObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('approver') + '/test/flp.html#app-preview',
        pages: {
			onTheIssuesList: IssuesList,
			onTheIssuesObjectPage: IssuesObjectPage,
			onTheIssueCommentsObjectPage: IssueCommentsObjectPage
        },
        async: true
    });

    return runner;
});

