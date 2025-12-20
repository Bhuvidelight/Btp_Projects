using MyService as service from '../../srv/service';
annotate service.Customers with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : '{i18n>CustomerId}',
                Value : CustomerID,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>CustomerName}',
                Value : name,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Email}',
                Value : email,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>PhoneNumber1}',
                Value : phone,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Address}',
                Value : address,
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
            Label : 'Orders',
            ID : 'Orders',
            Target : 'CustomerstoOrders/@UI.LineItem#Orders',
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
            Label : '{i18n>CustomerName}',
            Value : name,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Email}',
            Value : email,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>PhoneNumber}',
            Value : phone,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Address}',
            Value : address,
        },
    ],
);

annotate service.Orders with @(
    UI.LineItem #Orders : [
        {
            $Type : 'UI.DataField',
            Value : CustomerID,
            Label : '{i18n>CustomerId}',
        },
        {
            $Type : 'UI.DataField',
            Value : orderDate,
            Label : '{i18n>OrderedDate}',
        },
        {
            $Type : 'UI.DataField',
            Value : OrderID,
            Label : '{i18n>OrderId}',
        },
        {
            $Type : 'UI.DataField',
            Value : orderItem,
            Label : '{i18n>OrderItem}',
        },
        {
            $Type : 'UI.DataField',
            Value : totalAmount,
            Label : '{i18n>TotalAmount}',
        },
        {
            $Type : 'UI.DataField',
            Value : status,
            Label : '{i18n>OrderStatus}',
        },
    ],
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Orders Info',
            ID : 'OrdersInfo',
            Target : '@UI.FieldGroup#OrdersInfo',
        },
    ],
    UI.FieldGroup #OrdersInfo : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : CustomerID,
                Label : '{i18n>CustomerId}',
            },
            {
                $Type : 'UI.DataField',
                Value : OrderID,
                Label : '{i18n>OrderId}',
            },
            {
                $Type : 'UI.DataField',
                Value : orderDate,
                Label : '{i18n>OrderedDate}',
            },
            {
                $Type : 'UI.DataField',
                Value : orderItem,
                Label : '{i18n>Orderitem}',
            },
            {
                $Type : 'UI.DataField',
                Value : status,
                Label : '{i18n>Status}',
            },
            {
                $Type : 'UI.DataField',
                Value : totalAmount,
                Label : '{i18n>TotalAmount}',
            },
        ],
    },
);

