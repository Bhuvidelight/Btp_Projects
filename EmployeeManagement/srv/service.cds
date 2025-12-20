using EmployeeManagement  from '../db/Schema';

service MyService  {
    @odata.draft.enabled
    entity EmployeeDetails as projection on EmployeeManagement.EmployeeDetails;
    entity EmployeeDocuments as projection on EmployeeManagement.EmployeeDocuments;

}
