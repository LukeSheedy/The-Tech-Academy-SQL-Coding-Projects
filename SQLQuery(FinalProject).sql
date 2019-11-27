
USE MASTER
GO
CREATE DATABASE FINAL_PROJECT2
GO
USE FINAL_PROJECT2
GO



ALTER TABLE tbl_bookloans
ALTER COLUMN bookloans_datedue VARCHAR(30);

BEGIN


		
	/******************************************************
	 * Build our database tables and define ther schema
	 ******************************************************/	
		CREATE TABLE tbl_librarybranch (
		librarybranch_branchid INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		librarybranch_branchname VARCHAR(50) NOT NULL,
		librarybranch_address VARCHAR(50) NOT NULL
	);

		CREATE TABLE tbl_publisher (
		publisher_publishernameid VARCHAR(50) PRIMARY KEY NOT NULL,
		publisher_adress VARCHAR(50) NOT NULL,
		publisher_phone VARCHAR(30)NOT NULL
	);


		CREATE TABLE tbl_books (
		books_bookid INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		books_title VARCHAR(50) NOT NULL,
		books_publishernameid VARCHAR(50) NOT NULL FOREIGN KEY REFERENCES tbl_publisher(publisher_publishernameid) ON UPDATE CASCADE ON DELETE CASCADE
	);

		CREATE TABLE tbl_authors (
		authors_bookid INT NOT NULL FOREIGN KEY REFERENCES tbl_books(books_bookid) ON UPDATE CASCADE ON DELETE CASCADE,
		authors_authorname VARCHAR(50) NOT NULL
	);


	CREATE TABLE tbl_bookcopies (
		bookcopies_bookid INT NOT NULL FOREIGN KEY REFERENCES tbl_books(books_bookid) ON UPDATE CASCADE ON DELETE CASCADE,
		bookcopies_branchid INT NOT NULL  FOREIGN KEY REFERENCES tbl_librarybranch(librarybranch_branchid) ON UPDATE CASCADE ON DELETE CASCADE,
		bookcopies_numberofcopies INT NOT NULL
	);

	
	CREATE TABLE tbl_borrower (
		borrower_cardnoid INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		borrower_name VARCHAR(50) NOT NULL,
		borrower_address VARCHAR(50) NOT NULL,
		borrower_phone VARCHAR(30)NOT NULL
	);


	CREATE TABLE tbl_bookloans (
		bookloans_bookid INT NOT NULL FOREIGN KEY REFERENCES tbl_books(books_bookid) ON UPDATE CASCADE ON DELETE CASCADE,
		bookloans_branchid INT NOT NULL FOREIGN KEY REFERENCES tbl_librarybranch(librarybranch_branchid) ON UPDATE CASCADE ON DELETE CASCADE,
		bookloans_cardnoid INT NOT NULL FOREIGN KEY REFERENCES tbl_borrower(borrower_cardnoid) ON UPDATE CASCADE ON DELETE CASCADE,
		bookloans_dateout VARCHAR(30)NOT NULL,
		bookloans_datedue VARCHAR(30)NOT NULL
	);




		/******************************************************
	 * Now that the tables are built, we populate them
	 ******************************************************/
	INSERT INTO tbl_librarybranch
	(librarybranch_branchname,librarybranch_address)
	VALUES 
	('Sharpstown','IN TOWN'),
	('Central', 'OUT OF TOWN'),
	('Helmsdeep','ABOVE TOWN'),
	('Rohan', 'UNDER OF TOWN')
	;
	SELECT * FROM  tbl_librarybranch

	INSERT INTO tbl_publisher
	(publisher_publishernameid,publisher_adress,publisher_phone)
	VALUES 
	('Penguin Random House','IN TOWN','3855996587'),
	('HarperCollins', 'OUT OF TOWN','3855995555'),
	('Macmillan Publishers','ABOVE TOWN','3855996666')
	;
	SELECT * FROM  tbl_publisher

	INSERT INTO tbl_books 
	(books_title,books_publishernameid)
	VALUES 
	('The Lost Tribe', 'Penguin Random House'),
	('SCARY', 'Penguin Random House'),
	('SPOOKY', 'Penguin Random House'),
	('BOOK 4', 'Penguin Random House'),
	('BOOK 5', 'Penguin Random House'),
	('BOOK 6', 'Penguin Random House'),
	('BOOK 7', 'Penguin Random House'),
	('BOOK 8', 'Penguin Random House'),
	('BOOK 9', 'Macmillan Publishers'),
	('BOOK 10', 'Macmillan Publishers'),
	('BOOK 11', 'Macmillan Publishers'),
	('BOOK 12', 'Macmillan Publishers'),
	('BOOK 13', 'Macmillan Publishers'),
	('BOOK 14', 'Macmillan Publishers'),
	('BOOK 15', 'HarperCollins'),
	('BOOK 16', 'HarperCollins'),
	('BOOK 17', 'HarperCollins'),
	('BOOK 18', 'HarperCollins'),
	('BOOK 19', 'HarperCollins'),
	('BOOK 20', 'HarperCollins')
	;

		SELECT * FROM  tbl_books 

	INSERT INTO tbl_authors
	(authors_bookid,authors_authorname)
	VALUES 
	(1, 'Alexander Aaronsohn '),
	(2, 'Stephen King'),
	(3, 'Stephen King'),
	(4, 'Robert Anwood'),
	(5, 'Marion Anstis'),
	(6, 'Marion Anstis'),
	(7, 'Poul Anderson'),
	(8, 'Poul Anderson'),
	(9, 'Isaac Alfasi'),
	(10,'Isaac Alfasi'),
	(11,'Isaac Alfasi'),
	( 12, 'Isaac Alfasi'),
	( 13, 'Rochelle Alers'),
	( 14, 'Rochelle Alers'),
	(15,'Rochelle Alers'),
	(16,'Rochelle Alers'),
	( 17, 'Louisa May Alcott'),
	( 18, 'Louisa May Alcott'),
	( 19,'Mitch Albom'),
	(20, 'Henry Abbey')
	;
	SELECT * FROM  tbl_authors


	INSERT INTO tbl_bookcopies 
	(bookcopies_bookid, bookcopies_branchid,bookcopies_numberofcopies)
	VALUES 
	( 1, 1,2 ), /*SHARPS TOWN REFREENCE TO LOST TRIBE*/
	( 2, 1,2 ),
	( 3, 1,2 ),
	( 4, 1,2 ),
	( 5, 1,2 ),
	( 6, 1,2 ),
	( 7, 1,2 ),
	( 8, 1,2 ),
	( 9, 1,2 ),
	( 10, 1,2 ),
	( 15, 2,2 ),/*CENTRAL TOWN REFRENCE*/
	( 16, 2,2 ),
	( 11, 2,2 ),
	( 4, 2,2 ),
	( 8, 2,2 ),
	( 6, 2,2 ),
	( 2, 2,2 ),/*STEPHEN KING IN CENTRAL BRANCH*/
	( 3, 2,2 ),/*STEPHEN KING IN CENTRAL BRANCH*/
	( 9, 2,2 ),
	( 10, 2,2 ),
	( 11, 3,2 ),/*HELMSDEEP TOWN REFRENCE*/
	( 10, 3,2 ),
	( 9, 3,2 ),
	( 8, 3,2 ),
	( 7, 3,2 ),
	( 6, 3,2 ),
	( 5, 3,2 ),
	( 4, 3,2 ),
	( 3, 3,2 ),
	( 2, 3,2 ),
	( 11, 4,2 ),/*ROHAN TOWN REFRENCE*/
	( 12, 4,2 ),
	( 13, 4,2 ),
	( 14, 4,2 ),
	( 15, 4,2 ),
	( 16, 4,2 ),
	( 17, 4,2 ),
	( 18, 4,2 ),
	( 19, 4,2 ),
	( 20, 4,2 )
	;

	SELECT * FROM  tbl_bookcopies 
	
	INSERT INTO tbl_borrower
	(borrower_name, borrower_address, borrower_phone)
	VALUES 
	('Timmy Red',' Moms House', '8002505555'),
	('Willy Blue',' Dads House', '8002506666'),
	('Billy Yellow','Dads House', '8002501111'),
	('Jimmy Green', 'Dads House', '8002502222'),
	('Dimmy Brown', 'Moms House', '8002503333'),
	('Nimmy Black', 'Dads House', '8002504444'),
	('Gimmy Orange', 'Grandpas House', '8002507777'),
	('Fimmy White', 'Moms House', '8002508888')
	;

	SELECT * FROM  tbl_borrower


	INSERT INTO tbl_bookloans
	(bookloans_bookid, bookloans_branchid, bookloans_cardnoid, bookloans_dateout, bookloans_datedue)
	VALUES 
	( 11, 4, 1, '2019-11-20', '2019-11-27'),
	( 12, 4, 1, '2019-11-20', '2019-11-27'),
	( 13, 4, 1, '2019-11-20', '2019-11-27'),
	( 14, 4, 1, '2019-11-20', '2019-11-27'),
	( 15, 4, 1, '2019-11-20', '2019-11-27'),
	( 16, 4, 1, '2019-11-20', '2019-11-27'),
	( 17, 4, 1, '2019-11-20', '2019-11-27'),
	( 18, 4, 1, '2019-11-20', '2019-11-27'),
	( 19, 4, 1, '2019-11-20', '2019-11-27'),
	( 20, 4, 1, '2019-11-20', '2019-11-27'),
	( 11, 4, 2, '2019-11-20', '2019-11-26'),
	( 12, 4, 2, '2019-11-20', '2019-11-26'),
	( 13, 4, 2, '2019-11-20', '2019-11-26'),
	( 14, 4, 2, '2019-11-20', '2019-11-26'),
	( 15, 4, 2, '2019-11-20', '2019-11-26'),
	( 16, 4, 2, '2019-11-20', '2019-11-26'),
	( 17, 4, 2, '2019-11-20', '2019-11-26'),
	( 18, 4, 2, '2019-11-20', '2019-11-26'),
	( 19, 4, 2, '2019-11-20', '2019-11-26'),
	( 20, 4, 2, '2019-11-20', '2019-11-26'),
	( 11, 4, 2, '2019-11-20', '2019-11-26'),
	( 12, 4, 2, '2019-11-20', '2019-11-26'),
	( 13, 4, 2, '2019-11-20', '2019-11-26'),
	( 14, 4, 2, '2019-11-20', '2019-11-26'),
	( 15, 4, 2, '2019-11-20', '2019-11-26'),
	( 16, 4, 2, '2019-11-20', '2019-11-26'),
	( 17, 4, 2, '2019-11-20', '2019-11-26'),
	( 18, 4, 2, '2019-11-20', '2019-11-26'),
	( 19, 4, 2, '2019-11-20', '2019-11-26'),
	( 20, 4, 2, '2019-11-20', '2019-11-26'),
	( 11, 3, 1, '2019-11-21', '2019-11-29'),
	( 10, 3, 1, '019-11-21', '2019-11-29'),
	( 9, 3 , 1, '2019-11-21', '2019-11-29'),
	( 8, 3, 1, '2019-11-21', '2019-11-29'),
	( 7, 3, 1, '2019-11-21', '2019-11-29'),
	( 6, 3, 1, '2019-11-21', '2019-11-29'),
	( 5, 3, 1, '2019-11-21', '2019-11-29'),
	( 4, 3, 1, '2019-11-21', '2019-11-29'),
	( 3, 3, 1, '2019-11-21', '2019-11-29'),
	( 2, 3, 1, '2019-11-21', '2019-11-29'),
	( 11, 3, 2, '2019-11-21','2019-11-30'),
	( 10, 3, 2,'2019-11-21', '2019-11-30'),
	( 9, 3 , 2,'2019-11-21', '2019-11-30'),
	( 8, 3, 2, '2019-11-21', '2019-11-30'),
	( 7, 3, 2, '2019-11-21', '2019-11-30' ),
	( 6, 3, 2, '2019-11-21', '2019-11-30' ),
	( 5, 3, 2, '2019-11-21', '2019-11-30' ),
	( 4, 3, 2, '2019-11-21', '2019-11-30' ),
	( 3, 3, 2, '2019-11-21', '2019-11-30' ),
	( 2, 3, 2, '2019-11-21', '2019-11-30' ),
	( 2, 1, 3, '2019-11-20', '2019-11-26' ),
	( 3, 1, 3, '2019-11-20', '2019-11-26' ),
	( 4, 1, 3, '2019-11-20', '2019-11-26' ),
	( 5, 1, 3, '2019-11-20', '2019-11-26' ),
	( 6, 1, 3, '2019-11-20', '2019-11-26' ),
	( 7, 1, 4, '2019-11-20', '2019-11-26' ),
	( 8, 1, 4, '2019-11-20', '2019-11-26'),
	( 9, 1, 4, '2019-11-20', '2019-11-25'),
	( 10, 1, 4, '2019-11-20', '2019-11-25' )
	;

	SELECT * FROM  tbl_bookloans


	SELECT * FROM tbl_bookcopies 
	SELECT * FROM tbl_books 
	SELECT * FROM tbl_librarybranch 

		/*****************************************************
	 * The following SELECT queries database using INNER JOINS.
	 ******************************************************/
	/*FIRST QUESTION [CORRECT] (How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown")*/
	
	SELECT books_title, bookcopies_numberofcopies,librarybranch_branchname
	FROM tbl_bookcopies
	INNER JOIN tbl_books ON bookcopies_bookid = books_bookid
	INNER JOIN tbl_librarybranch ON bookcopies_branchid = librarybranch_branchid
	WHERE books_title = 'The Lost Tribe' AND librarybranch_branchname = 'Sharpstown';

	/*SECOND QUESTION[CORRECT](How many copies of the book titled "The Lost Tribe" are owned by each library branch) 2*/
	/*ACCIDENTLY ONLY MADE 2 COPIES TO THE SHARPSTOWN ONLY!!*/
	SELECT  bookcopies_numberofcopies,books_title, librarybranch_branchname
	FROM tbl_bookcopies 
	INNER JOIN tbl_books ON bookcopies_bookid = books_bookid
	INNER JOIN tbl_librarybranch ON bookcopies_branchid = librarybranch_branchid
	WHERE bookcopies_bookid <= 1 ;

	/*3rd QUESTION[CORRECT] ( Retrieve the names of all borrowers who do not have any books checked out). 3*/
	SELECT * FROM tbl_borrower
	SELECT * FROM tbl_bookloans
	
	SELECT * 
	FROM tbl_borrower
	FULL OUTER JOIN tbl_bookloans ON bookloans_cardnoid = borrower_cardnoid
	WHERE bookloans_bookid IS NULL;

	/*4th QUESTION[CORRECT](For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today, 
	retrieve the book title, the borrower's name, and the borrower's address) 4*/
	SELECT bookloans_datedue,librarybranch_branchname, books_title, borrower_name, borrower_address
	FROM tbl_bookloans 
	INNER JOIN tbl_librarybranch ON bookloans_branchid = librarybranch_branchid
	INNER JOIN tbl_books ON bookloans_bookid = books_bookid 
	INNER JOIN tbl_borrower ON borrower_cardnoid = bookloans_cardnoid
	WHERE bookloans_datedue = '2019-11-26' AND librarybranch_branchname = 'Sharpstown';
		
	
	/* QUESTION 5[CORRECT](For each library branch, retrieve the branch name and the
	total number of books loaned out from that branch).*/

	SELECT  librarybranch_branchname, COUNT(bookloans_datedue)
	FROM tbl_librarybranch
	INNER JOIN tbl_bookloans ON bookloans_branchid = librarybranch_branchid
	GROUP BY librarybranch_branchname

	/*6th QUESTION [CORRECT](Retrieve the names, addresses, and the number of books checked out for all 
	borrowers who have more than five books checked out.)6*/
	SELECT borrower_name, borrower_address, COUNT(bookloans_cardnoid)
	FROM tbl_bookloans
	INNER JOIN tbl_borrower ON borrower_cardnoid = bookloans_cardnoid
	GROUP BY borrower_address, borrower_name

	SELECT* FROM tbl_borrower
	SELECT* FROM tbl_bookloans

	/*7th QUESTION[CORRECT] (For each book authored (or co-authored) by "Stephen King", retrieve the title and the number of copies 
	owned by the library branch whose name is "Central".) 7*/
	SELECT bookcopies_numberofcopies,authors_authorname, librarybranch_branchname
	FROM tbl_bookcopies 
	INNER JOIN tbl_authors ON bookcopies_bookid = authors_bookid
	INNER JOIN tbl_librarybranch ON bookcopies_branchid = librarybranch_branchid
	WHERE authors_authorname= 'Stephen King' AND librarybranch_branchname = 'Central';
	END

GO

