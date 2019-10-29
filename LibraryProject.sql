Create DATABASE DB_Project2;

USE DB_Project2;

CREATE TABLE LIBRARY_BRANCH(
	BranchID INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	BranchName nvarchar(50),
	Address nvarchar(50));

INSERT INTO LIBRARY_BRANCH (BranchName,Address)
	VALUES ('SharpsTown','High Falls, Utah'), ('Central','RidgeCrest, California'),('West','San Mateo, California'),
	('South','Fort Worth, Texas');

CREATE TABLE PUBLISHER(
	PublisherName nvarchar(50) PRIMARY KEY NOT NULL,
	Address nvarchar(50),
	Phone nvarchar(25));

INSERT INTO PUBLISHER (PublisherName, Address, Phone)
VALUES('Penguin Books', 'London, United Kingdom', '940-567-4566'),('Scholatic','New York, New York','234-765-7465'),
('Knopf Books','West Valley, Utah','978-576-3245'),('Puffin','Farmsville, Montana','678-586-2234'),
('Allen & Unwin','Farmington, New Zealand','645-837-1234'),('Scribner','Hollywood,California','902-102-9021'),
('Ballantine Books','Phoenix, Arizona','234-746-7362'),('The Chicken House','Atlantas, the Pacific','898-857-2345'),('Penguin Random House','Portland, Oregon','765-949-8349');



CREATE TABLE BOOKS(
	BookID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	Title nvarchar(50),
	PublisherName nvarchar(50) NOT NULL CONSTRAINT fk_PublisherName FOREIGN KEY
	REFERENCES PUBLISHER(PublisherName) ON UPDATE CASCADE ON DELETE CASCADE
	);

	
INSERT INTO BOOKS(Title,PublisherName)
VALUES ('Elantris','Holtzbrinck Publishing Group'),('The Lost Tribe','Macmillan Publisher'),('The Emperors Soul','Holtzbrinck Publishing Group'),
('Mistborn','Holtzbrinck Publishing Group'),('Eragon','Penguin Random House'),('Eldest','Penguin Random House'),
('Brisingr','Penguin Random House'),('Inheritance','Penguin Random House'),('Bands of Mourning','Holtzbrinck Publishing Group'),
('Alcatraz Versus the Evil Librarians','Holtzbrinck Publishing Group'),('Alcatraz Versus the Scriveners Bones','Holtzbrinck Publishing Group'),
('Alcatraz Versus the Knights of Crystallia','Holtzbrinck Publishing Group'),('Alcatraz Versus the Shattered Lens','Holtzbrinck Publishing Group'),
('The Dark Talent','Holtzbrinck Publishing Group'),('The Gathering Storm','Holtzbrinck Publishing Group'),('The Hobbit','Allen & Unwin'),
('The Fellowship of the Ring','Allen & Unwin'),('The Ruins of Gorlan','Penguin Random House'),('The Burning Bridge','Penguin Random House'),
('The Icebound Land','Penguin Random House'),('The Battle for Skandia','Penguin Random House'),('The Sorcerer in the North','Penguin Random House'),
('The Siege of Macindaw','Penguin Random House'),('Erak’s Ransom','Penguin Random House'),('The Kings of Clonmel','Penguin Random House'),
('It','Scribner'),('The Shining','Scribner');

CREATE TABLE BOOK_AUTHORS (
BookID INT NOT NULL CONSTRAINT fk_BookID FOREIGN KEY REFERENCES BOOKS(BookID) ON
UPDATE CASCADE ON DELETE CASCADE,
AuthorName nvarchar(50),
);

INSERT INTO BOOK_AUTHORS (BookID,AuthorName)
VALUES (01,'Brandon Sanderson'),(02,'Mark Lee'),(03,'Brandon Sanderson'),(04,'Brandon Sanderson'),(05,'Christopher Paolini'),(06,'Christopher Paolini'),(07,'Christopher Paolini'),(08,'Christopher Paolini'),(09,'Brandon Sanderson'),(10,'Brandon Sanderson'),(11,'Brandon Sanderson'),(12,'Brandon Sanderson'),
(13,'Brandon Sanderson'),(14,'Brandon Sanderson'),(15,'Brandon Sanderson'),(16,'J.R.R. Tolkien'),(17,'J.R.R. Tolkien'),(18,'John Flanagan'),(19,'John Flanagan'),(20,'John Flanagan'),
(21,'John Flanagan'),(22,'John Flanagan'),(23,'John Flanagan'),(24,'John Flanagan'),(25,'John Flanagan'),(26,'Stephen King'),(27,'Stephen King')


CREATE TABLE BOOK_COPIES (
	BookID INT NOT NULL CONSTRAINT fk_BookID2 FOREIGN KEY REFERENCES BOOKS(BookID) ON
	UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_BranchID2 FOREIGN KEY REFERENCES
	LIBRARY_BRANCH(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	Number_Of_Copies INT,
	);

INSERT INTO BOOK_COPIES(BookID,BranchID,Number_Of_Copies)
VALUES(1,1,3),(2,1,3),(3,1,3),(4,1,13),(5,1,3),(6,1,3),(7,1,3),(8,1,3),(9,1,3),(10,1,3),(11,1,3),(12,1,3),(13,1,3),
(14,1,3),(15,1,3),(16,1,3),(17,1,3),(18,1,3),(19,1,3),(20,1,3),(21,1,3),(22,1,3),(23,1,3),(24,1,3),(25,1,3),(26,1,3),(27,1,3),
(1,2,3),(2,2,3),(3,2,3),(4,2,13),(5,2,3),(6,4,3),(7,2,3),(8,2,3),(9,2,3),(10,2,3),(11,2,3),(12,2,3),(13,2,3),
(14,2,3),(15,2,3),(16,2,3),(17,2,3),(18,2,3),(19,2,3),(20,2,3),(21,2,3),(22,2,3),(23,2,3),(24,2,3),(25,2,3),(26,2,3),(27,2,3),
(1,3,3),(2,3,3),(3,3,3),(4,3,13),(5,3,3),(6,3,3),(7,3,3),(8,3,3),(9,3,3),(10,3,3),(11,3,3),(12,3,3),(13,3,3),
(14,3,3),(15,3,3),(16,3,3),(17,3,3),(18,3,3),(19,3,3),(20,3,3),(21,3,3),(22,3,3),(23,3,3),(24,3,3),(25,3,3),(26,3,3),(27,3,3),
(1,4,3),(2,4,3),(3,4,3),(4,4,13),(5,4,3),(6,4,3),(7,4,3),(8,4,3),(9,4,3),(10,4,3),(11,4,3),(12,4,3),(13,4,3),
(14,4,3),(15,4,3),(16,4,3),(17,4,3),(18,4,3),(19,4,3),(20,4,3),(21,4,3),(22,4,3),(23,4,3),(24,4,3),(25,4,3),(26,4,3),(27,4,3)

CREATE TABLE BOOK_LOANS (
BookID INT NOT NULL CONSTRAINT fk_BookID3 FOREIGN KEY REFERENCES BOOKS(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
BranchID INT NOT NULL CONSTRAINT fk_BranchID3 FOREIGN KEY REFERENCES LIBRARY_BRANCH(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
CardNo INT NOT NULL CONSTRAINT fk_CardNo FOREIGN KEY REFERENCES BORROWERS(CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
DateOut nvarchar(50),
DateDue nvarchar(50)
);

INSERT INTO BOOK_LOANS(BookID,BranchID,CardNo,DateOut,DateDue)
VALUES(10,2,8,'10/1/2019','11/1/2019'),(19,1,7,'10/7/2019','11/7/2019'),(5,3,1,'10/1/2019','11/1/2019'),(11,4,6,'10/7/2019','11/7/2019'),
(1,2,4,'11/03/2019','12/03/2019'),(2,2,4,'11/03/2019','12/03/2019'),(3,2,4,'11/03/2019','12/03/2019'),(5,2,4,'11/03/2019','12/03/2019'),(4,2,4,'11/03/2019','12/03/2019'),
(12,2,4,'11/03/2019','12/03/2019'),(26,2,4,'11/03/2019','12/03/2019'),(8,2,4,'11/03/2019','12/03/2019'),(7,2,4,'11/03/2019','12/03/2019'),(6,2,4,'11/03/2019','12/03/2019'),
(13,2,4,'11/03/2019','12/03/2019'),(14,2,4,'11/03/2019','12/03/2019'),(19,2,4,'11/03/2019','12/03/2019'),(20,2,4,'11/03/2019','12/03/2019'),(25,2,4,'11/03/2019','12/03/2019'),
(10,2,4,'11/03/2019','12/03/2019'),(15,2,4,'11/03/2019','12/03/2019'),(18,2,4,'11/03/2019','12/03/2019'),(21,2,4,'11/03/2019','12/03/2019'),(24,2,4,'11/03/2019','12/03/2019'),
(11,2,4,'11/03/2019','12/03/2019'),(16,2,4,'11/03/2019','12/03/2019'),(17,2,4,'11/03/2019','12/03/2019'),(22,2,4,'11/03/2019','12/03/2019'),(23,2,4,'11/03/2019','12/03/2019'),
(6,4,3,'10/23/2019','11/23/2019'),(1,4,3,'10/23/2019','11/23/2019'),(15,4,3,'10/23/2019','11/23/2019'),(16,4,3,'10/23/2019','11/23/2019'),(21,4,3,'10/23/2019','11/23/2019'),
(7,4,3,'10/23/2019','11/23/2019'),(2,4,3,'10/23/2019','11/23/2019'),(14,4,3,'10/23/2019','11/23/2019'),(17,4,3,'10/23/2019','11/23/2019'),(22,4,3,'10/23/2019','11/23/2019'),
(8,4,3,'10/23/2019','11/23/2019'),(3,4,3,'10/23/2019','11/23/2019'),(27,4,3,'10/23/2019','11/23/2019'),(18,4,3,'10/23/2019','11/23/2019'),(23,4,3,'10/23/2019','11/23/2019'),
(9,4,3,'10/23/2019','11/23/2019'),(4,4,3,'10/23/2019','11/23/2019'),(12,4,3,'10/23/2019','11/23/2019'),(19,4,3,'10/23/2019','11/23/2019'),(24,4,3,'10/23/2019','11/23/2019'),
(10,4,3,'10/23/2019','11/23/2019'),(5,4,3,'10/23/2019','11/23/2019'),(11,4,3,'10/23/2019','11/23/2019'),(20,4,3,'10/23/2019','11/23/2019'),(25,4,3,'10/23/2019','11/23/2019')

CREATE TABLE BORROWERS (
CardNo INT PRIMARY KEY NOT NULL IDENTITY (1,1),
Name nvarchar(50),
Address nvarchar(50),
Phone nvarchar(25),
);

INSERT INTO BORROWERS (Name,Address,Phone)
VALUES ('Peter Potter','12765 Jackson Ave, San Jose, Califoria','456-895-4458'),('Enry Johnson','1345 State Street, Provo, Utah','801-665-8954'),
('Kyle Meister','7783 Terrence Dr, Fort Worth, Texas','940-784-3325'),('John Jefe','349 Tickle St, Carrolton, Texas','817-998-4788'),
('Raz Al Gul','Altraea, Himalayas','415-847-9630'),('Emma Lester','348 S 900 E, Highland, Utah','801-778-2252'),('Aura Smith','2743 Siko St, San Bruno, California',''),
('Don Piere','3889 Main St, Orem, Utah','801-778-4413')


SELECT Number_Of_Copies FROM BOOK_COPIES;

CREATE PROC pr_SharpsLost
AS
BEGIN
SELECT Number_Of_Copies FROM BOOK_COPIES
INNER JOIN LIBRARY_BRANCH ON BOOK_COPIES.BranchID = LIBRARY_BRANCH.BranchID
INNER JOIN BOOKS ON BOOK_COPIES.BookID = BOOKS.BookID
Where BranchName = 'Sharpstown' AND Title = 'The Lost Tribe'
END


CREATE PROC pr_copiesofLost
AS
BEGIN
SELECT Number_of_Copies From BOOK_COPIES
INNER JOIN LIBRARY_BRANCH ON BOOK_COPIES.BranchID = LIBRARY_BRANCH.BranchID
WHERE BookID = '2'
GROUP BY BranchName, Number_Of_Copies
END

Create PROC pr_EmptyBorrower
AS
BEGIN
SELECT Name FROM BORROWERS BR
FULL OUTER JOIN BOOK_LOANS BL ON BR.CardNo = BL.CardNo
WHERE DateOut IS NULL;

END

 
CREATE PROC pr_GetTitle
 @BranchName NVARCHAR(25), @DateDue DATE
AS
BEGIN

SELECT BOOKS.Title, BORROWERS.Address, BOOK_LOANS.DateDue
FROM BOOK_LOANS
INNER JOIN BOOKS ON BOOK_LOANS.BookID = BOOKS.BookID
INNER JOIN BORROWERS ON BOOK_LOANS.CardNo = BORROWERS.CardNo
INNER JOIN LIBRARY_BRANCH ON BOOK_LOANS.BranchID = LIBRARY_BRANCH.BranchID
WHERE BranchName = @BranchName AND DateDue = @DateDue;
END

Execute pr_GetTitle @BranchName = 'Sharpstown', @DateDue = '2019-11-07'
GO
CREATE PROCEDURE pr_BranchLoans
AS
BEGIN
SELECT LIBRARY_BRANCH.BranchName,COUNT(BOOK_LOANS.BranchID) AS Total_Book_Out FROM
LIBRARY_BRANCH JOIN BOOK_LOANS ON LIBRARY_BRANCH.BranchID = BOOK_LOANS.BranchID
GROUP BY BOOK_LOANS.BranchID, LIBRARY_BRANCH.BranchName
END

EXEC pr_GetBranchName


GO
CREATE PROCEDURE pr_GetNames_Add_Books
AS
BEGIN

SELECT BORROWERS.Name, BORROWERS.Address, COUNT(BOOK_LOANS.CardNo) AS No_Of_Books
FROM BORROWERS
JOIN BOOK_LOANS
ON BORROWERS.CardNo = BOOK_LOANS.CardNo
GROUP BY BORROWERS.Name, BORROWERS.Address,BOOK_LOANS.CardNo
HAVING COUNT(BOOK_LOANS.CardNo) > 5
END


EXEC pr_GetNames_Add_Books

GO
CREATE PROCEDURE pr_GetTitle_books
@BranchName NVARCHAR(25), @AuthorName NVARCHAR(25)
AS
BEGIN

SELECT BOOKS.Title, BOOK_COPIES.Number_Of_Copies
FROM BOOK_COPIES
JOIN BOOK_AUTHORS BA ON BOOK_COPIES.BookID = BA.BookID
JOIN BOOKS ON BOOK_COPIES.BookID = BOOKS.BookID
JOIN LIBRARY_BRANCH ON BOOK_COPIES.BranchID = LIBRARY_BRANCH.BranchID
WHERE BranchName = @BranchName AND AuthorName = @AuthorName;
END

EXEC pr_GetTitle_books @BranchName = 'Central', @AuthorName = 'Stephen King'

SELECT BookID, BranchID FROM BOOK_COPIES;

SELECT * FROM BOOK_AUTHORS
SELECT * FROM BOOK_COPIES
SELECT * FROM LIBRARY_BRANCH
SELECT * FROM BOOK_LOANS
SELECT * FROM BORROWERS
SELECT * FROM PUBLISHER

SELECT * FROM BOOKS

