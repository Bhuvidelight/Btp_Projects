using EcommerceManagement from '../db/Schema';

service Myservice {

    entity Customers   as projection on EcommerceManagement.Customers;
    entity Order       as projection on EcommerceManagement.Order;
    entity Delivery    as projection on EcommerceManagement.Delivery;
    entity Employees   as projection on EcommerceManagement.Employees;
    entity Payment     as projection on EcommerceManagement.Payment;
    entity Products    as projection on EcommerceManagement.Products;
    entity Stores      as projection on EcommerceManagement.Stores;

    // Action to calculate total sum spent by a customer
    function onTotalSum(cId: Int16) returns Int16;

}
