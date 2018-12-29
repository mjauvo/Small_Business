-- Drop all the database tables in exactly
-- reversed order as they were created.

--------------------------------------------------------------------
-- T A B L E S   W I T H   F O R E I G N   K E Y S   ( 1 4 )
--------------------------------------------------------------------

DROP TABLE tblWorkOrder;
DROP TABLE tblShipment;
DROP TABLE tblSaleOrdersProducts;
DROP TABLE tblSaleInvoiceNotice;
DROP TABLE tblSaleInvoice;
DROP TABLE tblSaleOrder;
DROP TABLE tblPurchaseOrdersProducts;
DROP TABLE tblPurchaseInvoice;
DROP TABLE tblPurchaseOrder;
DROP TABLE tblProduct;
DROP TABLE tblPass;
DROP TABLE tblEmployment;
DROP TABLE tblEmployee;
DROP TABLE tblCustomer;

--------------------------------------------------------------------
-- T A B L E S   W I T H   O N L Y   P R I M A R Y   K E Y S   ( 9 )
--------------------------------------------------------------------

DROP TABLE tblUser;
DROP TABLE tblSupplier;
DROP TABLE tblSalaryType;
DROP TABLE tblProductCategory;
DROP TABLE tblForwarder;
DROP TABLE tblEmploymentType;
DROP TABLE tblEmploymentLevel;
DROP TABLE tblDepartment;
DROP TABLE tblCustomerType;
