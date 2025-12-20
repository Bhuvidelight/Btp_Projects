using MyService1 as service from '../../srv/service1';
annotate service.Orders with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : '{i18n>OrderId}',
                Value : OrderID,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>CustomerId}',
                Value : CustomerID,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Orderitem}',
                Value : orderItem,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>OrderedDate}',
                Value : orderDate,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Status}',
                Value : status,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>TotalAmount}',
                Value : totalAmount,
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
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Issues',
            ID : 'Issues',
            Target : 'OrderstoIssues/@UI.LineItem#Issues',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : '{i18n>CustomerId}',
            Value : CustomerID,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>OrderId}',
            Value : OrderID,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Orderitem}',
            Value : orderItem,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>OrderedDate}',
            Value : orderDate,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Status}',
            Value : status,
        },
    ],
);

annotate service.Issues with @(
    UI.LineItem #Issues : [
        {
            $Type : 'UI.DataField',
            Value : IssueID,
            Label : '{i18n>IssueId}',
        },
        {
            $Type : 'UI.DataField',
            Value : issueType_code,
            Label : '{i18n>Issuetype}',
        },
        {
            $Type : 'UI.DataField',
            Value : OrderID,
            Label : '{i18n>OrderId}',
        },
        {
            $Type : 'UI.DataField',
            Value : requestType_code,
            Label : '{i18n>Requesttype}',
        },
    ],
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Issues Info',
            ID : 'IssuesInfo',
            Target : '@UI.FieldGroup#IssuesInfo',
        },
    ],
    UI.FieldGroup #IssuesInfo : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : IssueID,
                Label : '{i18n>IssueId}',
            },
            {
                $Type : 'UI.DataField',
                Value : issueType_code,
                Label : '{i18n>Issuetype}',
            },
            {
                $Type : 'UI.DataField',
                Value : OrderID,
                Label : '{i18n>OrderId}',
            },
            {
                $Type : 'UI.DataField',
                Value : requestType_code,
                Label : '{i18n>Requesttype}',
            },
        ],
    },
);

annotate service.Issues with {
    requestType @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'requestType',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : requestType_code,
                    ValueListProperty : 'code',
                },
            ],
            Label : 'Request Type',
        },
        Common.ValueListWithFixedValues : true,
)};

annotate service.requestType with {
    code @Common.Text : description
};

annotate service.Issues with {
    issueType @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'IssueType',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : issueType_code,
                    ValueListProperty : 'code',
                },
            ],
            Label : 'Issue Type',
        },
        Common.ValueListWithFixedValues : true,
)};

annotate service.IssueType with {
    code @Common.Text : description
};

