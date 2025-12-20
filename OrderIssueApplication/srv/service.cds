using OrderIssueApplication from '../db/Schema';

service MyService {
  @odata.draft.enabled
  entity Customers as projection on OrderIssueApplication.Customers;
  entity Orders as projection on OrderIssueApplication.Orders;
  
}

