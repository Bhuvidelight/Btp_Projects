using MyService4 as service from '../../srv/service4';
annotate service.ApproverLevels with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : '{i18n>ApprovalLevel}',
                Value : Approvallevel,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Approver Name',
                Value : ApproverName,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>ApproverEmail}',
                Value : ApproverEmail,
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
            Label : '{i18n>ApprovalLevel}',
            Value : Approvallevel,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>ApproverName}',
            Value : ApproverName,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>ApproverEmail}',
            Value : ApproverEmail,
        },
    ],
);

