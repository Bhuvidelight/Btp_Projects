sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"employeemanagement/test/integration/pages/EmployeeDetailsList",
	"employeemanagement/test/integration/pages/EmployeeDetailsObjectPage",
	"employeemanagement/test/integration/pages/EmployeeDocumentsObjectPage"
], function (JourneyRunner, EmployeeDetailsList, EmployeeDetailsObjectPage, EmployeeDocumentsObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('employeemanagement') + '/test/flp.html#app-preview',
        pages: {
			onTheEmployeeDetailsList: EmployeeDetailsList,
			onTheEmployeeDetailsObjectPage: EmployeeDetailsObjectPage,
			onTheEmployeeDocumentsObjectPage: EmployeeDocumentsObjectPage
        },
        async: true
    });

    return runner;
});

