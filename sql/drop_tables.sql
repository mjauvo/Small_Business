-- Drop all the database tables in exactly reverse
-- order as they were created, i.e. first foreign
-- key tables and then primary key tables.

--------------------------------------------------------------------
-- T A B L E S   W I T H   F O R E I G N   K E Y S   ( 1 4 )
--------------------------------------------------------------------

DROP TABLE IF EXISTS tblWorkOrder;
DROP TABLE IF EXISTS tblShipment;
DROP TABLE IF EXISTS tblSaleOrdersProducts;
DROP TABLE IF EXISTS tblSaleInvoiceNotice;
DROP TABLE IF EXISTS tblSaleInvoice;
DROP TABLE IF EXISTS tblSaleOrder;
DROP TABLE IF EXISTS tblPurchaseOrdersProducts;
DROP TABLE IF EXISTS tblPurchaseInvoice;
DROP TABLE IF EXISTS tblPurchaseOrder;
DROP TABLE IF EXISTS tblProduct;
DROP TABLE IF EXISTS tblPass;
DROP TABLE IF EXISTS tblEmployment;
DROP TABLE IF EXISTS tblEmployee;
DROP TABLE IF EXISTS tblCustomer;

--------------------------------------------------------------------
-- T A B L E S   W I T H   O N L Y   P R I M A R Y   K E Y S   ( 9 )
--------------------------------------------------------------------

DROP TABLE IF EXISTS tblUser;
DROP TABLE IF EXISTS tblSupplier;
DROP TABLE IF EXISTS tblSalaryType;
DROP TABLE IF EXISTS tblProductCategory;
DROP TABLE IF EXISTS tblForwarder;
DROP TABLE IF EXISTS tblEmploymentType;
DROP TABLE IF EXISTS tblEmploymentLevel;
DROP TABLE IF EXISTS tblDepartment;
DROP TABLE IF EXISTS tblCustomerType;
