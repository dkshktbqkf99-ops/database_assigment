CREATE TABLE PetOwners (
    ownerID INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    contact VARCHAR(50)
);

CREATE TABLE Pets (
    PetID INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    breed VARCHAR(50),
    ownerID INT,
    FOREIGN KEY (ownerID) REFERENCES PetOwners(ownerID)
);

CREATE TABLE Room (
    RoomID INT AUTO_INCREMENT PRIMARY KEY,
    RoomInventory VARCHAR(50),  
    RoomNumber VARCHAR(50),
    RoomType VARCHAR(50),
    RoomPrice DECIMAL(18, 0)
);

CREATE TABLE Reservation (
    ReservationID INT AUTO_INCREMENT PRIMARY KEY,
    startdate DATETIME NOT NULL,
    enddate DATETIME NOT NULL,
    ownerID INT, 
    PetID INT,
    RoomID INT,
    FOREIGN KEY (PetID) REFERENCES Pets(PetID),
    FOREIGN KEY (RoomID) REFERENCES Room(RoomID),
    FOREIGN KEY (ownerID) REFERENCES PetOwners(ownerID)  
);

CREATE TABLE Service (
    serviceID INT AUTO_INCREMENT PRIMARY KEY,
    serviceType VARCHAR(50),
    servicePrice DECIMAL(10, 2),
    ReservationID INT,
    FOREIGN KEY (ReservationID) REFERENCES Reservation(ReservationID)
);