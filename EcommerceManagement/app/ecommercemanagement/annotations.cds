using Myservice as service from '../../srv/service';
annotate service.Customers with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : cId,
            },
            {
                $Type : 'UI.DataField',
                Label : 'cName',
                Value : cName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'cNumber',
                Value : cNumber,
            },
            {
                $Type : 'UI.DataField',
                Label : 'cAddress',
                Value : cAddress,
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
            Value : cId,
        },
        {
            $Type : 'UI.DataField',
            Label : 'cName',
            Value : cName,
        },
        {
            $Type : 'UI.DataField',
            Label : 'cNumber',
            Value : cNumber,
        },
        {
            $Type : 'UI.DataField',
            Label : 'cAddress',
            Value : cAddress,
        },
    ],
);

annotate service.Order with @(
    UI.LineItem #Orders : [
        {
            $Type : 'UI.DataField',
            Value : OrdertoCustomers.CustomerstoOrders.cId,
            Label : 'cId',
        },
        {
            $Type : 'UI.DataField',
            Value : OrdertoCustomers.CustomerstoOrders.delId,
            Label : 'delId',
        },
        {
            $Type : 'UI.DataField',
            Value : OrdertoCustomers.CustomerstoOrders.oId,
            Label : 'oId',
        },
        {
            $Type : 'UI.DataField',
            Value : OrdertoCustomers.CustomerstoOrders.oStatus,
            Label : 'oStatus',
        },
        {
            $Type : 'UI.DataField',
            Value : OrdertoCustomers.CustomerstoOrders.pId,
            Label : 'pId',
        },
        {
            $Type : 'UI.DataField',
            Value : Total,
            Label : 'Total',
        },
    ],
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Payment',
            ID : 'Payment',
            Target : 'OrdertoProducts/@UI.LineItem#Payment',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Delivery',
            ID : 'Delivery',
            Target : 'OrdertoProducts/@UI.LineItem#Delivery',
        },
    ],
);

annotate service.Products with @(
    UI.LineItem #Payment : [
        {
            $Type : 'UI.DataField',
            Value : ProductstoOrder.OrdertoPayment.amount,
            Label : 'amount',
        },
        {
            $Type : 'UI.DataField',
            Value : ProductstoOrder.OrdertoPayment.oId,
            Label : 'oId',
        },
        {
            $Type : 'UI.DataField',
            Value : ProductstoOrder.OrdertoPayment.payId,
            Label : 'payId',
        },
        {
            $Type : 'UI.DataField',
            Value : ProductstoOrder.OrdertoPayment.pStatus,
            Label : 'pStatus',
        },
    ],
    UI.LineItem #Delivery : [
        {
            $Type : 'UI.DataField',
            Value : ProductstoOrder.OrdertoDelivery.delId,
            Label : 'delId',
        },
        {
            $Type : 'UI.DataField',
            Value : ProductstoOrder.OrdertoDelivery.delLoc,
            Label : 'delLoc',
        },
        {
            $Type : 'UI.DataField',
            Value : ProductstoOrder.OrdertoDelivery.empid,
            Label : 'empid',
        },
        {
            $Type : 'UI.DataField',
            Value : ProductstoOrder.OrdertoDelivery.oId,
            Label : 'oId',
        },
        {
            $Type : 'UI.DataField',
            Value : ProductstoOrder.OrdertoDelivery.pId,
            Label : 'pId',
        },
    ],
);

