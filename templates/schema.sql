-- Schema provided in the document
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

-- Other schema definitions from the document

