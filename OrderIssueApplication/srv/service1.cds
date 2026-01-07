using OrderIssueApplication from '../db/Schema';

service MyService1 {

  @odata.draft.enabled
  entity Orders           as projection on OrderIssueApplication.Orders;

  entity Issues           as projection on OrderIssueApplication.Issues;

  entity IssueAttachments as projection on OrderIssueApplication.IssueAttachments;
  entity IssueComments    as projection on OrderIssueApplication.IssueComments;
  entity IssueType        as projection on OrderIssueApplication.IssueType;
  entity requestType      as projection on OrderIssueApplication.requestType;
  entity ApproverLevels as projection on OrderIssueApplication.ApproverLevels;
  entity ApprovalHistory as projection on OrderIssueApplication.ApprovalHistory;  



  function addComment(commentID: String, IssueID: String, text: String) returns String;

  function commentsDraft(IssueID: String, description: String) returns String;


  function sendForApproval(
    OrderID    : String,
    IssueID: String,
  ) returns String;

  }

annotate MyService1.Orders with
@Capabilities.InsertRestrictions: {Insertable: false};

annotate MyService1.Orders with
@Capabilities.DeleteRestrictions: {Deletable: false};
