CREATE TABLE Category (
    mainCategory VARCHAR(50),
    subCategory VARCHAR(50),
    catNotes TEXT,
    PRIMARY KEY (mainCategory, subCategory)
);

CREATE TABLE Item (
    itemID INT AUTO_INCREMENT,
    iDescription TEXT,
    photo TEXT,
    color VARCHAR(20),
    isNew BOOLEAN,
    hasPieces BOOLEAN,
    material VARCHAR(50),
    mainCategory VARCHAR(50),
    subCategory VARCHAR(50),
    PRIMARY KEY (itemID),
    FOREIGN KEY (mainCategory, subCategory) REFERENCES Category(mainCategory, subCategory)
);

CREATE TABLE Person (
    userName VARCHAR(50) PRIMARY KEY,
    password VARCHAR(255),
    fname VARCHAR(50),
    lname VARCHAR(50),
    email VARCHAR(100)
);

CREATE TABLE PersonPhone (
    userName VARCHAR(50),
    phone VARCHAR(15),
    PRIMARY KEY (userName, phone),
    FOREIGN KEY (userName) REFERENCES Person(userName)
);

CREATE TABLE DonatedBy (
    itemID INT,
    userName VARCHAR(50),
    donateDate DATE,
    PRIMARY KEY (itemID, userName),
    FOREIGN KEY (itemID) REFERENCES Item(itemID),
    FOREIGN KEY (userName) REFERENCES Person(userName)
);

CREATE TABLE Role (
    roleID INT AUTO_INCREMENT PRIMARY KEY,
    rDescription TEXT
);

CREATE TABLE Act (
    userName VARCHAR(50),
    roleID INT,
    PRIMARY KEY (userName, roleID),
    FOREIGN KEY (userName) REFERENCES Person(userName),
    FOREIGN KEY (roleID) REFERENCES Role(roleID)
);

CREATE TABLE Location (
    roomNum INT,
    shelfNum INT,
    shelfDescription TEXT,
    PRIMARY KEY (roomNum, shelfNum)
);

CREATE TABLE Piece (
    itemID INT,
    pieceNum INT,
    pDescription TEXT,
    length DECIMAL(5, 2),
    width DECIMAL(5, 2),
    height DECIMAL(5, 2),
    roomNum INT,
    shelfNum INT,
    pNotes TEXT,
    PRIMARY KEY (itemID, pieceNum),
    FOREIGN KEY (itemID) REFERENCES Item(itemID),
    FOREIGN KEY (roomNum, shelfNum) REFERENCES Location(roomNum, shelfNum)
);

CREATE TABLE Ordered (
    orderID INT AUTO_INCREMENT PRIMARY KEY,
    orderDate DATE,
    orderNotes TEXT,
    supervisor VARCHAR(50),
    client VARCHAR(50),
    FOREIGN KEY (supervisor) REFERENCES Person(userName),
    FOREIGN KEY (client) REFERENCES Person(userName)
);

CREATE TABLE ItemIn (
    itemID INT,
    orderID INT,
    found BOOLEAN,
    PRIMARY KEY (itemID, orderID),
    FOREIGN KEY (itemID) REFERENCES Item(itemID),
    FOREIGN KEY (orderID) REFERENCES Ordered(orderID)
);

CREATE TABLE Delivered (
    userName VARCHAR(50),
    orderID INT,
    status VARCHAR(50),
    date DATE,
    PRIMARY KEY (userName, orderID),
    FOREIGN KEY (userName) REFERENCES Person(userName),
    FOREIGN KEY (orderID) REFERENCES Ordered(orderID)
);
































