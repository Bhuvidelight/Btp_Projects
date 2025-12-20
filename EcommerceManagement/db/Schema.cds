// namespace LibraryManagement;

// entity Author {
//     key AuthorId  : Int16; 
//     AuthorName    : String;
//     BookTitle     : String;
//     Bookid        : Int16;

//     Books : Composition of many Books on Books.Author = $self;
// }

// entity Books {
//     key Bookid         : Int16;
//     BookTitle          : String;
//     AuthorId           : Int16;
//     PublishedYear      : Int16;

//     Author : Association to Author on Author.AuthorId = AuthorId;
//     Borrowers : Composition of many Borrower on Borrowers.Book = $self;
// }

// entity Borrower {
//     key BorrowerId   : Int16;
//     BorrowerName     : String;
//     BookTitle        : String;
//     Bookid           : Int16;
//     AuthorId         : Int16;
//     IssueDate        : String;
//     ReturnDate       : String;

//     Book   : Association to Books  on Book.Bookid = Bookid;
//     Author : Association to Author on Author.AuthorId = AuthorId;
// }


//For Ecommerce

namespace EcommerceManagement ;

    entity Customers {
        key cId: Int16 @title : 'Customer Id';
        cName: String;
        cNumber: Int16;
        cAddress: String @readonly;
        CustomerstoOrders: Composition of many Order on CustomerstoOrders.OrdertoCustomers = $self;
    }

    entity Order {
        key oId: Int16 @UI.Placeholder : 'orderId';
        key cId: Int16 @readonly;
        key pId: Int16;
        key delId: Int16;
        Total:Int16;
        oStatus: String;

        OrdertoProducts: Composition of many Products on OrdertoProducts.ProductstoOrder=$self;
        OrdertoPayment: Composition of one Payment on OrdertoPayment.PaymenttoOrder =$self;
        OrdertoCustomers: Association to one Customers on OrdertoCustomers.cId = cId;
        OrdertoDelivery: Composition of one Delivery on OrdertoDelivery.DeliverytoOrder = $self;
    }

    entity Products {
        key pId: Int16;
        key storeId: Int16;
        pName: String;
        pAvailability: String;
        pType: String;
        ProductstoStores: Association to one  Stores on ProductstoStores.storeId=storeId; 
        ProductstoOrder: Association to one Order on ProductstoOrder.pId = pId;
    }

    entity Payment {
        key payId: Int16;
        key oId: Int16;
        amount: Int16;
        pStatus: String;
        PaymenttoOrder: Association to one Order on PaymenttoOrder.oId = oId;
    }

    entity Delivery {
        key delId: Int16;
        key oId: Int16;
        key pId:Int16;
        key empId:Int16;
        delLoc: String;
        DeliverytoOrder: Association to one Order on DeliverytoOrder.oId = oId;
        DeliverytoEmployees:Composition of one Employees on DeliverytoEmployees.EmployeestoDelivery=$self;
    }

    entity Stores {
        key storeId: Int16;
        key empId: Int16;
        key storenumber:Int16;
        storeName: String;
        sAddress: String;
        StorestoProducts: Composition of many Products on StorestoProducts.ProductstoStores=$self;
        StorestoEmployees: Composition of many Employees on StorestoEmployees.EmployeestoStores = $self;
    }

    entity Employees {
        key empId: Int16;
        key storeId: Int16;
        key delId:Int16;
        empName: String;
        empphone : String;
        EmployeestoStores: Association to one Stores on EmployeestoStores.empId = empId;
        EmployeestoDelivery:Association to many Delivery on EmployeestoDelivery.delId=delId;
    }

