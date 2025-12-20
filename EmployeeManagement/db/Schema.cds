using { cuid, managed } from '@sap/cds/common';
namespace EmployeeManagement;

entity EmployeeDetails : cuid, managed {
    key EmployeeID : String;

    employeeName   : String;
    department     : String;
    email          : String;
    phone          : String;

    
    EmployeeDetailstoEmployeeDocuments : Composition of many EmployeeDocuments
        on EmployeeDetailstoEmployeeDocuments.EmployeeDocumentstoEmployeeDetails = $self;
}

entity EmployeeDocuments : cuid, managed {

    key EmployeeID : String;

    @Core.MediaType : MediaType
    Content         : LargeBinary;

    @Core.IsMediaType : true
    MediaType       : String;

    FileName        : String;
    Size            : Integer;
    url             : String;

    EmployeeDocumentstoEmployeeDetails : Association to EmployeeDetails
        on EmployeeDocumentstoEmployeeDetails.EmployeeID = EmployeeID;
}
