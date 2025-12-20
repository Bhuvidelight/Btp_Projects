using Myservice as service from '../../srv/service';
annotate service.Stores with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'storeId',
                Value : storeId,
            },
            {
                $Type : 'UI.DataField',
                Label : 'empId',
                Value : empId,
            },
            {
                $Type : 'UI.DataField',
                Label : 'storeName',
                Value : storeName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'sAddress',
                Value : sAddress,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Products',
            ID : 'Products',
            Target : 'StorestoProducts/@UI.LineItem#Products2',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Employees',
            ID : 'Employees',
            Target : 'StorestoEmployees/@UI.LineItem#Employees3',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'storeId',
            Value : storeId,
        },
        {
            $Type : 'UI.DataField',
            Label : 'empId',
            Value : empId,
        },
        {
            $Type : 'UI.DataField',
            Label : 'storeName',
            Value : storeName,
        },
        {
            $Type : 'UI.DataField',
            Label : 'sAddress',
            Value : sAddress,
        },
    ],
    UI.FieldGroup #GeneralInfo : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : empId,
                Label : 'empId',
            },
            {
                $Type : 'UI.DataField',
                Value : sAddress,
                Label : 'sAddress',
            },
            {
                $Type : 'UI.DataField',
                Value : storeId,
                Label : 'storeId',
            },
            {
                $Type : 'UI.DataField',
                Value : storeName,
                Label : 'storeName',
            },
        ],
    },
    UI.FieldGroup #GeneralInfo1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : empId,
                Label : 'empId',
            },
            {
                $Type : 'UI.DataField',
                Value : sAddress,
                Label : 'sAddress',
            },
            {
                $Type : 'UI.DataField',
                Value : storeId,
                Label : 'storeId',
            },
            {
                $Type : 'UI.DataField',
                Value : storeName,
                Label : 'storeName',
            },
        ],
    },
);

annotate service.Products with @(
    UI.LineItem #Products : [
        {
            $Type : 'UI.DataField',
            Value : ProductstoStores.StorestoProducts.pAvailability,
            Label : 'pAvailability',
        },
        {
            $Type : 'UI.DataField',
            Value : ProductstoStores.StorestoProducts.pId,
            Label : 'pId',
        },
        {
            $Type : 'UI.DataField',
            Value : ProductstoStores.StorestoProducts.pName,
            Label : 'pName',
        },
        {
            $Type : 'UI.DataField',
            Value : ProductstoStores.StorestoProducts.storeId,
            Label : 'storeId',
        },
        {
            $Type : 'UI.DataField',
            Value : ProductstoStores.StorestoProducts.pType,
            Label : 'pType',
        },
    ],
    UI.LineItem #Products1 : [
        {
            $Type : 'UI.DataField',
            Value : ProductstoStores.StorestoProducts.pAvailability,
            Label : 'pAvailability',
        },
        {
            $Type : 'UI.DataField',
            Value : ProductstoStores.StorestoProducts.pId,
            Label : 'pId',
        },
        {
            $Type : 'UI.DataField',
            Value : ProductstoStores.StorestoProducts.pName,
            Label : 'pName',
        },
        {
            $Type : 'UI.DataField',
            Value : ProductstoStores.StorestoProducts.pType,
            Label : 'pType',
        },
        {
            $Type : 'UI.DataField',
            Value : ProductstoStores.StorestoProducts.storeId,
            Label : 'storeId',
        },
    ],
    UI.LineItem #Products2 : [
        {
            $Type : 'UI.DataField',
            Value : ProductstoStores.StorestoProducts.pId,
            Label : 'pId',
        },
        {
            $Type : 'UI.DataField',
            Value : ProductstoStores.StorestoProducts.pAvailability,
            Label : 'pAvailability',
        },
        {
            $Type : 'UI.DataField',
            Value : ProductstoStores.StorestoProducts.pName,
            Label : 'pName',
        },
        {
            $Type : 'UI.DataField',
            Value : ProductstoStores.StorestoProducts.pType,
            Label : 'pType',
        },
        {
            $Type : 'UI.DataField',
            Value : ProductstoStores.StorestoProducts.storeId,
            Label : 'storeId',
        },
    ],
);

annotate service.Employees with @(
    UI.LineItem #Employees : [
        {
            $Type : 'UI.DataField',
            Value : EmployeestoStores.StorestoEmployees.delId,
            Label : 'delId',
        },
        {
            $Type : 'UI.DataField',
            Value : EmployeestoStores.StorestoEmployees.empId,
            Label : 'empId',
        },
        {
            $Type : 'UI.DataField',
            Value : EmployeestoStores.StorestoEmployees.empName,
            Label : 'empName',
        },
        {
            $Type : 'UI.DataField',
            Value : EmployeestoStores.StorestoEmployees.storeId,
            Label : 'storeId',
        },
    ],
    UI.LineItem #Employees1 : [
        {
            $Type : 'UI.DataField',
            Value : EmployeestoStores.StorestoEmployees.delId,
            Label : 'delId',
        },
        {
            $Type : 'UI.DataField',
            Value : EmployeestoStores.StorestoEmployees.empId,
            Label : 'empId',
        },
        {
            $Type : 'UI.DataField',
            Value : EmployeestoStores.StorestoEmployees.empName,
            Label : 'empName',
        },
        {
            $Type : 'UI.DataField',
            Value : EmployeestoStores.StorestoEmployees.storeId,
            Label : 'storeId',
        },
    ],
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Delivery',
            ID : 'Delivery',
            Target : 'EmployeestoDelivery/@UI.LineItem#Delivery1',
        },
    ],
    UI.LineItem #Employees2 : [
        {
            $Type : 'UI.DataField',
            Value : EmployeestoStores.StorestoEmployees.delId,
            Label : 'delId',
        },
        {
            $Type : 'UI.DataField',
            Value : EmployeestoStores.StorestoEmployees.empName,
            Label : 'empName',
        },
        {
            $Type : 'UI.DataField',
            Value : EmployeestoStores.StorestoEmployees.empId,
            Label : 'empId',
        },
        {
            $Type : 'UI.DataField',
            Value : EmployeestoStores.StorestoEmployees.storeId,
            Label : 'storeId',
        },
    ],
    UI.LineItem #Employees3 : [
        {
            $Type : 'UI.DataField',
            Value : EmployeestoStores.StorestoEmployees.empId,
            Label : 'empId',
        },
        {
            $Type : 'UI.DataField',
            Value : EmployeestoStores.StorestoEmployees.storeId,
            Label : 'storeId',
        },
        {
            $Type : 'UI.DataField',
            Value : EmployeestoStores.StorestoEmployees.delId,
            Label : 'delId',
        },
        {
            $Type : 'UI.DataField',
            Value : EmployeestoStores.StorestoEmployees.empName,
            Label : 'empName',
        },
    ],
    UI.FieldGroup #Delivery : {
        $Type : 'UI.FieldGroupType',
        Data : [
        ],
    },
    UI.FieldGroup #Orders : {
        $Type : 'UI.FieldGroupType',
        Data : [
        ],
    },
    UI.FieldGroup #Orders1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : EmployeestoStores.StorestoProducts.ProductstoOrder.cId,
                Label : 'cId',
            },
            {
                $Type : 'UI.DataField',
                Value : EmployeestoStores.StorestoProducts.ProductstoOrder.delId,
                Label : 'delId',
            },
            {
                $Type : 'UI.DataField',
                Value : EmployeestoStores.StorestoProducts.ProductstoOrder.oId,
                Label : 'oId',
            },
            {
                $Type : 'UI.DataField',
                Value : EmployeestoStores.StorestoProducts.ProductstoOrder.oStatus,
                Label : 'oStatus',
            },
            {
                $Type : 'UI.DataField',
                Value : EmployeestoStores.StorestoProducts.ProductstoOrder.pId,
                Label : 'pId',
            },
        ],
    },
);

annotate service.Delivery with @(
    UI.LineItem #Products : [
        {
            $Type : 'UI.DataField',
            Value : DeliverytoEmployees.EmployeestoStores.StorestoEmployees.delId,
            Label : 'delId',
        },
        {
            $Type : 'UI.DataField',
            Value : DeliverytoEmployees.EmployeestoStores.StorestoEmployees.empId,
            Label : 'empId',
        },
        {
            $Type : 'UI.DataField',
            Value : DeliverytoEmployees.EmployeestoStores.StorestoEmployees.empName,
            Label : 'empName',
        },
        {
            $Type : 'UI.DataField',
            Value : DeliverytoEmployees.EmployeestoStores.StorestoEmployees.storeId,
            Label : 'storeId',
        },
    ],
    UI.LineItem #Employees : [
        {
            $Type : 'UI.DataField',
            Value : DeliverytoEmployees.EmployeestoStores.StorestoEmployees.delId,
            Label : 'delId',
        },
        {
            $Type : 'UI.DataField',
            Value : DeliverytoEmployees.EmployeestoStores.StorestoEmployees.empId,
            Label : 'empId',
        },
        {
            $Type : 'UI.DataField',
            Value : DeliverytoEmployees.EmployeestoStores.StorestoEmployees.empName,
            Label : 'empName',
        },
        {
            $Type : 'UI.DataField',
            Value : DeliverytoEmployees.EmployeestoStores.StorestoEmployees.storeId,
            Label : 'storeId',
        },
    ],
    UI.LineItem #Employees1 : [
        {
            $Type : 'UI.DataField',
            Value : DeliverytoEmployees.EmployeestoStores.StorestoEmployees.delId,
            Label : 'delId',
        },
        {
            $Type : 'UI.DataField',
            Value : DeliverytoEmployees.EmployeestoStores.StorestoEmployees.empId,
            Label : 'empId',
        },
        {
            $Type : 'UI.DataField',
            Value : DeliverytoEmployees.EmployeestoStores.StorestoEmployees.empName,
            Label : 'empName',
        },
        {
            $Type : 'UI.DataField',
            Value : DeliverytoEmployees.EmployeestoStores.StorestoEmployees.storeId,
            Label : 'storeId',
        },
    ],
    UI.LineItem #Delivery : [
        {
            $Type : 'UI.DataField',
            Value : DeliverytoEmployees.EmployeestoDelivery.delId,
            Label : 'delId',
        },
        {
            $Type : 'UI.DataField',
            Value : DeliverytoEmployees.EmployeestoDelivery.delLoc,
            Label : 'delLoc',
        },
        {
            $Type : 'UI.DataField',
            Value : DeliverytoEmployees.EmployeestoDelivery.empid,
            Label : 'empid',
        },
        {
            $Type : 'UI.DataField',
            Value : DeliverytoEmployees.EmployeestoDelivery.oId,
            Label : 'oId',
        },
    ],
    UI.LineItem #Delivery1 : [
        {
            $Type : 'UI.DataField',
            Value : DeliverytoEmployees.EmployeestoDelivery.delId,
            Label : 'delId',
        },
        {
            $Type : 'UI.DataField',
            Value : DeliverytoEmployees.EmployeestoDelivery.delLoc,
            Label : 'delLoc',
        },
        {
            $Type : 'UI.DataField',
            Value : DeliverytoEmployees.EmployeestoDelivery.empId,
            Label : 'empId',
        },
        {
            $Type : 'UI.DataField',
            Value : DeliverytoEmployees.EmployeestoDelivery.oId,
            Label : 'oId',
        },
    ],
);

