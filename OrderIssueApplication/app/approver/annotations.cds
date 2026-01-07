using MyService2 as service from '../../srv/service2';
using from '../../db/Schema';

annotate service.Issues with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : '{i18n>IssueId}',
                Value : IssueID,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>OrderId}',
                Value : OrderID,
            },
            {
                $Type : 'UI.DataField',
                Value : issueType_code,
                Label : '{i18n>Issuetype}',
            },
            {
                $Type : 'UI.DataField',
                Value : requestType_code,
                Label : '{i18n>Requesttype}',
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : '{i18n>OrderId}',
            Value : OrderID,
        },
        {
            $Type : 'UI.DataField',
            Label : 'IssueID',
            Value : IssueID,
        },
        {
            $Type : 'UI.DataField',
            Value : issueType_code,
            Label : '{i18n>IssueType}',
        },
        {
            $Type : 'UI.DataField',
            Value : requestType_code,
            Label : '{i18n>RequestType}',
        },
    ],
   
    UI.FieldGroup #Approvercomments : {
        $Type : 'UI.FieldGroupType',
        Data : [
        ],
    },
);

annotate service.IssueComments with @(
    UI.LineItem #Usercomments : [
        {
            $Type : 'UI.DataField',
            Value : CommentstoIssues.IssuestoComments.IssueID,
            Label : 'IssueID',
        },
        {
            $Type : 'UI.DataField',
            Value : CommentstoIssues.IssuestoComments.comment,
            Label : 'comment',
        },
        {
            $Type : 'UI.DataField',
            Value : CommentstoIssues.IssuestoComments.role,
            Label : 'role',
        },
    ],
    UI.LineItem #Approvercomments : [
        {
            $Type : 'UI.DataField',
            Value : role,
            Label : 'role',
        },
        {
            $Type : 'UI.DataField',
            Value : IssueID,
            Label : 'IssueID',
        },
        {
            $Type : 'UI.DataField',
            Value : comment,
            Label : 'comment',
        },
    ],
);

annotate service.IssueAttachments with @(
    UI.LineItem #Attachaments : [
        {
            $Type : 'UI.DataField',
            Value : MediaType,
            Label : 'MediaType',
        },
        {
            $Type : 'UI.DataField',
            Value : Size,
            Label : 'Size',
        },
        {
            $Type : 'UI.DataField',
            Value : Content,
            Label : 'Content',
        },
        {
            $Type : 'UI.DataField',
            Value : FileName,
            Label : 'FileName',
        },
        {
            $Type : 'UI.DataField',
            Value : IssueID,
            Label : 'IssueID',
        },
    ]
);

