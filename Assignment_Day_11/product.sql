CREATE TABLE tblCustomers (
    CustomerID SERIAL PRIMARY KEY,
    CompanyName VARCHAR(50) NOT NULL,
    ContactName VARCHAR(50),
    ContactTitle VARCHAR(30),
    Address VARCHAR(60),
    City VARCHAR(40),
    Region VARCHAR(40),
    PostalCode VARCHAR(10),
    Country VARCHAR(40) DEFAULT 'Canada',
    Phone VARCHAR(24),
    Fax VARCHAR(24)
);

CREATE TABLE tblOrders (
    OrderID SERIAL PRIMARY KEY,
    CustomerID INT REFERENCES tblCustomers(CustomerID),
    EmployeeID INT,
    OrderDate DATE,
    RequiredDate DATE,
    ShippedDate DATE,
    ShipVia INT,
    Freight NUMERIC(10,2),
    ShipName VARCHAR(50),
    ShipAddress VARCHAR(60),
    ShipCity VARCHAR(40),
    ShipRegion VARCHAR(40),
    ShipPostalCode VARCHAR(10),
    ShipCountry VARCHAR(40)
);

CREATE TABLE tblSuppliers (
    SupplierID SERIAL PRIMARY KEY,
    CompanyName VARCHAR(50),
    ContactName VARCHAR(50),
    ContactTitle VARCHAR(30),
    Address VARCHAR(60),
    City VARCHAR(40),
    Region VARCHAR(40),
    PostalCode VARCHAR(10),
    Country VARCHAR(40),
    Phone VARCHAR(24),
    Fax VARCHAR(24)
);

CREATE TABLE tblProducts (
    ProductID SERIAL PRIMARY KEY,
    ProductName VARCHAR(40),
    SupplierID INT REFERENCES tblSuppliers(SupplierID),
    CategoryID INT,
    QuantityPerUnit VARCHAR(20),
    UnitPrice NUMERIC(10,2),
    UnitsInStock INT,
    UnitsOnOrder INT,
    ReorderLevel INT,
    Discontinued BOOLEAN
);

CREATE TABLE tblOrderDetails (
    OrderID INT REFERENCES tblOrders(OrderID),
    ProductID INT REFERENCES tblProducts(ProductID),
    UnitPrice NUMERIC(10,2),
    Quantity INT CHECK (Quantity > 0),
    Discount NUMERIC(10,2),
    PRIMARY KEY (OrderID, ProductID)
);

CREATE TABLE tblShippers (
    ShipperID SERIAL PRIMARY KEY,
    CompanyName VARCHAR(50) UNIQUE,
    Phone VARCHAR(24)
);