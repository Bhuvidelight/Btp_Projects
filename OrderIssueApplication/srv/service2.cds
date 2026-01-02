using OrderIssueApplication from '../db/Schema';

service MyService2 {

  entity Issues          as projection on OrderIssueApplication.Issues;
  entity IssueComments   as projection on OrderIssueApplication.IssueComments;
  entity IssueAttachments as projection on OrderIssueApplication.IssueAttachments;

  function ApproverComment(
    IssueID : String,
    status:String
  ) returns String;

  function Approve(
    IssueID : String,
    OrderID : String,
    status  : String
  ) returns String;

  function Reject(
    IssueID : String,
    OrderID : String
  ) returns String;
}
