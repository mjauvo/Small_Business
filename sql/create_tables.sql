-- Create all the database tables by creating first
-- primary key tables and then foreign key tables.

--------------------------------------------------------------------
-- T A B L E S   W I T H   O N L Y   P R I M A R Y   K E Y S   ( 9 )
--------------------------------------------------------------------

CREATE TABLE tblCustomerType(
    ID                      SMALLINT NOT NULL, 
    description             VARCHAR (255) NOT NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE tblDepartment(
    ID                      SMALLINT NOT NULL, 
    departmentName          VARCHAR (255) NOT NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE tblEmploymentLevel(
    ID                      SMALLINT NULL, 
    description             VARCHAR (255) NOT NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE tblEmploymentType(
    ID                      SMALLINT NOT NULL, 
    description             VARCHAR (255) NOT NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE tblForwarder(
    ID                      SERIAL NOT NULL,
    businessName            VARCHAR(255) NOT NULL,
    streetAddress           VARCHAR(255) NOT NULL,
    postCode                INTEGER NOT NULL,
    city                    VARCHAR(255) NOT NULL,
    phone                   VARCHAR(255) NOT NULL,
    email                   VARCHAR(255) NOT NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE tblProductCategory(
    ID                      SMALLINT NOT NULL, 
    categoryName            VARCHAR(255) NOT NULL,
    description             VARCHAR(255) NOT NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE tblSalaryType(
    ID                      SMALLINT NOT NULL, 
    description             VARCHAR(255) NOT NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE tblSupplier(
    ID                      INTEGER NOT NULL, 
    supplierName            VARCHAR(255),
    streetAddress           VARCHAR(255),
    postCode                INTEGER,
    city                    VARCHAR(255),
    phone                   VARCHAR(255),
    email                   VARCHAR(255),
    PRIMARY KEY (ID)
);

CREATE TABLE tblUser(
    ID                      SERIAL NOT NULL,
    userName                VARCHAR(255),
    userType                SMALLINT,
    PRIMARY KEY (ID)
);

--------------------------------------------------------------------
-- T A B L E S   W I T H   F O R E I G N   K E Y S   ( 1 4 )
--------------------------------------------------------------------

CREATE TABLE tblCustomer(
    ID                      INTEGER NOT NULL,
    customerTypeID          SMALLINT NOT NULL,
    userID                  INTEGER NOT NULL,
    firstName               VARCHAR(255) NOT NULL,
    lastName                VARCHAR(255) NOT NULL,
    businessID              INTEGER,              
    businessName            VARCHAR(255),
    businessAccountDiscount SMALLINT,
    streetAddress           VARCHAR(255) NOT NULL,
    postCode                INTEGER NOT NULL,
    city                    VARCHAR(255) NOT NULL,
    phone                   VARCHAR(255) NOT NULL,
    email                   VARCHAR(255) NOT NULL,
    accountDisabled         BOOLEAN NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (customerTypeID) REFERENCES tblCustomerType (ID)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    FOREIGN KEY (userID) REFERENCES tblUser (ID)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

CREATE TABLE tblEmployee(
    ID                      INTEGER NOT NULL,
    userID                  INTEGER NOT NULL,
    firstName               VARCHAR(255) NOT NULL,
    lastName                VARCHAR(255) NOT NULL,
    dateOfBirth             DATE NOT NULL,
    streetAddress           VARCHAR(255) NOT NULL,
    postCode                INTEGER NOT NULL,
    city                    VARCHAR(255) NOT NULL,
    phone                   VARCHAR(255) NOT NULL,
    email                   VARCHAR(255),
    PRIMARY KEY (ID),
    FOREIGN KEY (userID) REFERENCES tblUser (ID)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

CREATE TABLE tblEmployment(
    ID                      INTEGER NOT NULL,
    employeeID              INTEGER NOT NULL,
    superiorID              INTEGER,
    departmentID            SMALLINT NOT NULL,
    employmentLevelID       SMALLINT NOT NULL,
    employmentTypeID        SMALLINT NOT NULL,
    jobTitle                VARCHAR(255) NOT NULL,
    startDate               DATE NOT NULL,
    endDate                 DATE,
    salaryType              SMALLINT NOT NULL,
    salary                  NUMERIC (8,2) NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (employeeID) REFERENCES tblEmployee (ID)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    FOREIGN KEY (superiorID) REFERENCES tblEmployee (ID)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    FOREIGN KEY (departmentID) REFERENCES tblDepartment (ID)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    FOREIGN KEY (employmentLevelID) REFERENCES tblEmploymentLevel (ID)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    FOREIGN KEY (employmentTypeID) REFERENCES tblEmploymentType (ID)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

CREATE TABLE tblPass(
    userID                  INTEGER NOT NULL,
    salt                    VARCHAR(255),
    hashed                  TEXT,
    PRIMARY KEY (userID),
    FOREIGN KEY (userID) REFERENCES tblUser (ID)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

CREATE TABLE tblProduct(
    ID                      INTEGER NOT NULL,
    productName             VARCHAR(255) NOT NULL,
    description             TEXT NOT NULL,
    categoryID              SMALLINT NOT NULL,
    supplierID              SMALLINT NOT NULL,
    unitPrice               NUMERIC (6,2) NOT NULL,
    reorderPoint            INTEGER NOT NULL,
    inventory               INTEGER NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (categoryID) REFERENCES tblProductCategory (ID)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    FOREIGN KEY (supplierID) REFERENCES tblSupplier (ID)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

CREATE TABLE tblPurchaseOrder(
    ID                      INTEGER NOT NULL,
    supplierID              INTEGER NOT NULL,
    status                  SMALLINT NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (supplierID) REFERENCES tblSupplier (ID)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

CREATE TABLE tblPurchaseInvoice(
    ID                      INTEGER NOT NULL,
    purchaseOrderID         INTEGER NOT NULL,
    invoiceSum              NUMERIC (7,2) NOT NULL,
    reference               INTEGER NOT NULL,
    dueDate                 DATE NOT NULL,
    paymentDate             DATE,
    PRIMARY KEY (ID),
    FOREIGN KEY (purchaseOrderID) REFERENCES tblPurchaseOrder (ID)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

CREATE TABLE tblPurchaseOrdersProducts(
    purchaseOrderID         INTEGER NOT NULL,
    productID               INTEGER NOT NULL,
    amount                  INTEGER NOT NULL,
    PRIMARY KEY (purchaseOrderID, productID),
    FOREIGN KEY (purchaseOrderID) REFERENCES tblPurchaseOrder (ID)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    FOREIGN KEY (productID) REFERENCES tblProduct (ID)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

CREATE TABLE tblSaleOrder(
    ID                      INTEGER NOT NULL,
    customerID              INTEGER NOT NULL,
    status                  SMALLINT NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (customerID) REFERENCES tblCustomer (ID)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

CREATE TABLE tblSaleInvoice(
    ID                      INTEGER NOT NULL,
    saleOrderID             INTEGER NOT NULL,
    invoiceSum              NUMERIC (7,2) NOT NULL,
    reference               INTEGER NOT NULL,
    dueDate                 DATE NOT NULL,
    paymentDate             DATE,
    PRIMARY KEY (ID),
    FOREIGN KEY (saleOrderID) REFERENCES tblSaleOrder (ID)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

CREATE TABLE tblSaleInvoiceNotice(
    saleInvoiceID           INTEGER NOT NULL,
    noticeNr                SMALLINT NOT NULL,
    debt                    NUMERIC (7,2) NOT NULL,
    dueDate                 DATE NOT NULL,
    paymentDate             DATE,
    PRIMARY KEY (saleInvoiceID),
    FOREIGN KEY (saleInvoiceID) REFERENCES tblSaleInvoice (ID)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

CREATE TABLE tblSaleOrdersProducts(
    saleOrderID             INTEGER NOT NULL,
    productID               INTEGER NOT NULL,
    amount                  INTEGER NOT NULL,
    PRIMARY KEY (saleOrderID, productID),
    FOREIGN KEY (saleOrderID) REFERENCES tblsaleOrder (ID)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    FOREIGN KEY (productID) REFERENCES tblProduct (ID)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

CREATE TABLE tblShipment(
    ID                      INTEGER NOT NULL,
    forwarderID             INTEGER NOT NULL,
    pickedUp                TIMESTAMP NOT NULL,
    deliveryDate            TIMESTAMP,
    PRIMARY KEY (ID),
    FOREIGN KEY (forwarderID) REFERENCES tblForwarder (ID)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

CREATE TABLE tblWorkOrder(
    ID                      INTEGER NOT NULL,
    saleOrderID             INTEGER NOT NULL,
    shipmentID              INTEGER,
    status                  SMALLINT NOT NULL,
    generationDate          DATE NOT NULL,
    completionDate          DATE,
    PRIMARY KEY (ID),
    FOREIGN KEY (saleOrderID) REFERENCES tblSaleOrder (ID)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    FOREIGN KEY (ShipmentID) REFERENCES tblShipment (ID)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);
