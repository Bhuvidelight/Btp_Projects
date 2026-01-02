namespace OrderIssueApplication;

using {cuid,managed} from '@sap/cds/common';

entity Customers {
    key CustomerID        : String @UI.Placeholder: 'CustomerId'  @readonly;
        name              : String @mandatory;
        email             : String @assert.format: '^[a-z0-9]+@gmail\.com$' @mandatory @UI.Placeholder: 'example@gmail.com';
        phone             : String @assert.format: '^[6-9][0-9]{9}$' @mandatory @UI.Placeholder: '10 digit phone number'; 
        address           : String;

        CustomerstoOrders : Composition of many Orders
                                on CustomerstoOrders.CustomerID = $self.CustomerID;
}


entity Orders {
    key OrderID           : String  @UI.Placeholder: 'orderId'     @readonly;
    key CustomerID        : String  @UI.Placeholder: 'CustomerId'  @readonly;
        orderItem         : String;
        orderDate         : Date;
        status            : String;
        totalAmount       : Integer;

        OrderstoCustomers : Association to one Customers
                                on OrderstoCustomers.CustomerID = CustomerID;
        OrderstoIssues    : Composition of many Issues
                                on OrderstoIssues.OrderID = $self.OrderID;
}

entity Issues {
    key IssueID : String @UI.Placeholder: 'IssueId' @readonly;
    key    OrderID : String @UI.Placeholder: 'orderId' @readonly;
   
    issueType  : Association to IssueType;
    requestType: Association to requestType;
    status : String default 'PENDING'; 
    InstanceId:String;

    IssuestoOrders      : Association to Orders
                              on IssuestoOrders.OrderID = OrderID;

    IssuestoAttachments : Composition of many IssueAttachments
                              on IssuestoAttachments.IssueID = $self.IssueID;

    IssuestoComments    : Composition of many IssueComments
                              on IssuestoComments.IssueID=$self.IssueID;
}


entity IssueComments : cuid, managed {

    key IssueID : String;
    OrderID : String;
    comment : String;
    role    : String default 'USER';
    status : String default 'PENDING';

    CommentstoIssues : Association to one Issues
        on CommentstoIssues.IssueID = IssueID
       and CommentstoIssues.OrderID = OrderID;
}

entity IssueAttachments : cuid, managed {
 
    key IssueID             : String @readonly;

        @Core.MediaType  : MediaType
        Content             : LargeBinary;

        @Core.IsMediaType: true
        MediaType           : String;
        FileName            : String;
        Size                : Integer;
        Url                 : String;
        AttachmentstoIssues : Association to one Issues
                                  on AttachmentstoIssues.IssueID = IssueID;
}

entity IssueType {
    key code        : String;
        description : String;

}

entity requestType {
    key code        : String;
        description : String;
}


