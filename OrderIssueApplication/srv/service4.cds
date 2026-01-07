using OrderIssueApplication  from '../db/Schema';

service MyService4 {
    @odata.draft.enabled
  entity ApproverLevels as projection on OrderIssueApplication.ApproverLevels;
}
