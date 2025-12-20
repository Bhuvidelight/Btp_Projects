using MyService as service from '../../srv/service';
annotate service.EmployeeDetails with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'EmployeeID',
                Value : EmployeeID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'employeeName',
                Value : employeeName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'department',
                Value : department,
            },
            {
                $Type : 'UI.DataField',
                Label : 'email',
                Value : email,
            },
            {
                $Type : 'UI.DataField',
                Label : 'phone',
                Value : phone,
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
            Label : 'Documents',
            ID : 'Documents',
            Target : 'EmployeeDetailstoEmployeeDocuments/@UI.LineItem#Documents',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'EmployeeID',
            Value : EmployeeID,
        },
        {
            $Type : 'UI.DataField',
            Label : 'employeeName',
            Value : employeeName,
        },
        {
            $Type : 'UI.DataField',
            Label : 'department',
            Value : department,
        },
        {
            $Type : 'UI.DataField',
            Label : 'email',
            Value : email,
        },
        {
            $Type : 'UI.DataField',
            Label : 'phone',
            Value : phone,
        },
    ],
);

annotate service.EmployeeDocuments with @(
    UI.LineItem #Employees : [
        {
            $Type : 'UI.DataField',
            Value : EmployeeDocumentstoEmployeeDetails.department,
            Label : 'department',
        },
        {
            $Type : 'UI.DataField',
            Value : EmployeeDocumentstoEmployeeDetails.email,
            Label : 'email',
        },
        {
            $Type : 'UI.DataField',
            Value : EmployeeDocumentstoEmployeeDetails.EmployeeID,
            Label : 'EmployeeID',
        },
        {
            $Type : 'UI.DataField',
            Value : EmployeeDocumentstoEmployeeDetails.employeeName,
            Label : 'employeeName',
        },
        {
            $Type : 'UI.DataField',
            Value : EmployeeDocumentstoEmployeeDetails.phone,
            Label : 'phone',
        },
    ],
    UI.LineItem #Documents : [
        {
            $Type : 'UI.DataField',
            Value : Content,
            Label : 'Content',
        },
        {
            $Type : 'UI.DataField',
            Value : EmployeeID,
            Label : 'EmployeeID',
        },
        {
            $Type : 'UI.DataField',
            Value : FileName,
            Label : 'FileName',
        },
        {
            $Type : 'UI.DataField',
            Value : url,
            Label : 'url',
        },
        {
            $Type : 'UI.DataField',
            Value : Size,
            Label : 'Size',
        },
        {
            $Type : 'UI.DataField',
            Value : MediaType,
            Label : 'MediaType',
        },
    ],
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Documents',
            ID : 'Documents',
            Target : '@UI.FieldGroup#Documents',
        },
    ],
    UI.FieldGroup #Documents : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : Content,
                Label : 'Content',
            },
            {
                $Type : 'UI.DataField',
                Value : ID,
                Label : 'ID',
            },
            {
                $Type : 'UI.DataField',
                Value : FileName,
                Label : 'FileName',
            },
            {
                $Type : 'UI.DataField',
                Value : Size,
                Label : 'Size',
            },
            {
                $Type : 'UI.DataField',
                Value : MediaType,
                Label : 'MediaType',
            },
        ],
    },
);

