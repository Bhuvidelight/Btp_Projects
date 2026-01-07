using OrderIssueApplication  from '../db/Schema';

service MyService5 {
    @odata.draft.enabled
  entity ApprovalHistory as projection on OrderIssueApplication.ApprovalHistory;
}