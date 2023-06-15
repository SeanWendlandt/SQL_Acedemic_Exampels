DROP TABLE IF EXISTS HENRY_AUTHOR;
DROP TABLE IF EXISTS HENRY_BOOK;
DROP TABLE IF EXISTS HENRY_BRANCH;
DROP TABLE IF EXISTS HENRY_INVENTORY;
DROP TABLE IF EXISTS HENRY_PUBLISHER;
DROP TABLE IF EXISTS HENRY_WROTE;

CREATE TABLE HENRY_AUTHOR 
(AUTHOR_NUM DECIMAL(2,0) PRIMARY KEY,
AUTHOR_LAST CHAR(12),
AUTHOR_FIRST CHAR(10) );
CREATE TABLE HENRY_BOOK 
(BOOK_CODE CHAR(4) PRIMARY KEY,
TITLE CHAR(40),
PUBLISHER_CODE CHAR(3),
TYPE CHAR(3),
PRICE DECIMAL(4,2),
PAPERBACK CHAR(1) );
CREATE TABLE HENRY_BRANCH 
(BRANCH_NUM DECIMAL(2,0) PRIMARY KEY,
BRANCH_NAME CHAR(50),
BRANCH_LOCATION CHAR(50),
NUM_EMPLOYEES DECIMAL(2,0) );
CREATE TABLE HENRY_INVENTORY 
(BOOK_CODE CHAR(4),
BRANCH_NUM DECIMAL(2,0),
ON_HAND DECIMAL(2,0),
PRIMARY KEY (BOOK_CODE, BRANCH_NUM) );
CREATE TABLE HENRY_PUBLISHER 
(PUBLISHER_CODE CHAR(3) PRIMARY KEY,
PUBLISHER_NAME CHAR(25),
CITY CHAR(20) );
CREATE TABLE HENRY_WROTE 
(BOOK_CODE CHAR(4),
AUTHOR_NUM DECIMAL(2,0),
SEQUENCE DECIMAL(1,0),
PRIMARY KEY (BOOK_CODE, AUTHOR_NUM) );
INSERT INTO HENRY_AUTHOR
VALUES
(1,'Morrison','Toni');
INSERT INTO HENRY_AUTHOR
VALUES
(2,'Solotaroff','Paul');
INSERT INTO HENRY_AUTHOR
VALUES
(3,'Vintage','Vernor');
INSERT INTO HENRY_AUTHOR
VALUES
(4,'Francis','Dick');
INSERT INTO HENRY_AUTHOR
VALUES
(5,'Straub','Peter');
INSERT INTO HENRY_AUTHOR
VALUES
(6,'King','Stephen');
INSERT INTO HENRY_AUTHOR
VALUES
(7,'Pratt','Philip');
INSERT INTO HENRY_AUTHOR
VALUES
(8,'Chase','Truddi');
INSERT INTO HENRY_AUTHOR
VALUES
(9,'Collins','Bradley');
INSERT INTO HENRY_AUTHOR
VALUES
(10,'Heller','Joseph');
INSERT INTO HENRY_AUTHOR
VALUES
(11,'Wills','Gary');
INSERT INTO HENRY_AUTHOR
VALUES
(12,'Hofstadter','Douglas R.');
INSERT INTO HENRY_AUTHOR
VALUES
(13,'Lee','Harper');
INSERT INTO HENRY_AUTHOR
VALUES
(14,'Ambrose','Stephen E.');
INSERT INTO HENRY_AUTHOR
VALUES
(15,'Rowling','J.K.');
INSERT INTO HENRY_AUTHOR
VALUES
(16,'Salinger','J.D.');
INSERT INTO HENRY_AUTHOR
VALUES
(17,'Heaney','Seamus');
INSERT INTO HENRY_AUTHOR
VALUES
(18,'Camus','Albert');
INSERT INTO HENRY_AUTHOR
VALUES
(19,'Collins, Jr.','Bradley');
INSERT INTO HENRY_AUTHOR
VALUES
(20,'Steinbeck','John');
INSERT INTO HENRY_AUTHOR
VALUES
(21,'Castelman','Riva');
INSERT INTO HENRY_AUTHOR
VALUES
(22,'Owen','Barbara');
INSERT INTO HENRY_AUTHOR
VALUES
(23,'O''Rourke','Randy');
INSERT INTO HENRY_AUTHOR
VALUES
(24,'Kidder','Tracy');
INSERT INTO HENRY_AUTHOR
VALUES
(25,'Schleining','Lon');
INSERT INTO HENRY_BOOK
VALUES
('0180','A Deepness in the Sky','TB','SFI',7.19,'Y');
INSERT INTO HENRY_BOOK
VALUES
('0189','Magic Terror','FA','HOR',7.99,'Y');
INSERT INTO HENRY_BOOK
VALUES
('0200','The Stranger','VB','FIC',8.00,'Y');
INSERT INTO HENRY_BOOK
VALUES
('0378','Venice','SS','ART',24.50,'N');
INSERT INTO HENRY_BOOK
VALUES
('079X','Second Wind','PU','MYS',24.95,'N');
INSERT INTO HENRY_BOOK
VALUES
('0808','The Edge','JP','MYS',6.99,'Y');
INSERT INTO HENRY_BOOK
VALUES
('1351','Dreamcatcher: A Novel','SC','HOR',19.60,'N');
INSERT INTO HENRY_BOOK
VALUES
('1382','Treasure Chests','TA','ART',24.46,'N');
INSERT INTO HENRY_BOOK
VALUES
('138X','Beloved','PL','FIC',12.95,'Y');
INSERT INTO HENRY_BOOK
VALUES
('2226','Harry Potter and the Prisoner of Azkaban','ST','SFI',13.96,'N');
INSERT INTO HENRY_BOOK
VALUES
('2281','Van Gogh and Gauguin','WP','ART',21.00,'N');
INSERT INTO HENRY_BOOK
VALUES
('2766','Of Mice and Men','PE','FIC',6.95,'Y');
INSERT INTO HENRY_BOOK
VALUES
('2908','Electric Light','FS','POE',14.00,'N');
INSERT INTO HENRY_BOOK
VALUES
('3350','Group: Six People in Search of a Life','BP','PSY',10.40,'Y');
INSERT INTO HENRY_BOOK
VALUES
('3743','Nine Stories','LB','FIC',5.99,'Y');
INSERT INTO HENRY_BOOK
VALUES
('3906','The Soul of a New Machine','BY','SCI',11.16,'Y');
INSERT INTO HENRY_BOOK
VALUES
('5163','Travels with Charley','PE','TRA',7.95,'Y');
INSERT INTO HENRY_BOOK
VALUES
('5790','Catch-22','SC','FIC',12.00,'Y');
INSERT INTO HENRY_BOOK
VALUES
('6128','Jazz','PL','FIC',12.95,'Y');
INSERT INTO HENRY_BOOK
VALUES
('6328','Band of Brothers','TO','HIS',9.60,'Y');
INSERT INTO HENRY_BOOK
VALUES
('669X','A Guide to SQL','CT','CMP',37.95,'Y');
INSERT INTO HENRY_BOOK
VALUES
('6908','Franny and Zooey','LB','FIC',5.99,'Y');
INSERT INTO HENRY_BOOK
VALUES
('7405','East of Eden','PE','FIC',12.95,'Y');
INSERT INTO HENRY_BOOK
VALUES
('7443','Harry Potter and the Goblet of Fire','ST','SFI',18.16,'N');
INSERT INTO HENRY_BOOK
VALUES
('7559','The Fall','VB','FIC',8.00,'Y');
INSERT INTO HENRY_BOOK
VALUES
('8092','Godel, Escher, Bach','BA','PHI',14.00,'Y');
INSERT INTO HENRY_BOOK
VALUES
('8720','When Rabbit Howls','JP','PSY',6.29,'Y');
INSERT INTO HENRY_BOOK
VALUES
('9611','Black House','RH','HOR',18.81,'N');
INSERT INTO HENRY_BOOK
VALUES
('9627','Song of Solomon','PL','FIC',14.00,'Y');
INSERT INTO HENRY_BOOK
VALUES
('9701','The Grapes of Wrath','PE','FIC',13.00,'Y');
INSERT INTO HENRY_BOOK
VALUES
('9882','Slay Ride','JP','MYS',6.99,'Y');
INSERT INTO HENRY_BOOK
VALUES
('9883','The Catcher in the Rye','LB','FIC',5.99,'Y');
INSERT INTO HENRY_BOOK
VALUES
('9931','To Kill a Mockingbird','HC','FIC',18.00,'N');
INSERT INTO HENRY_BRANCH
VALUES
(1,'Henry Downtown','16 Riverview',10);
INSERT INTO HENRY_BRANCH
VALUES
(2,'Henry On The Hill','1289 Bedford',6);
INSERT INTO HENRY_BRANCH
VALUES
(3,'Henry Brentwood','Brentwood Mall',15);
INSERT INTO HENRY_BRANCH
VALUES
(4,'Henry Eastshore','Eastshore Mall',9);
INSERT INTO HENRY_INVENTORY
VALUES
('0180',1,2);
INSERT INTO HENRY_INVENTORY
VALUES
('0189',2,2);
INSERT INTO HENRY_INVENTORY
VALUES
('0200',1,1);
INSERT INTO HENRY_INVENTORY
VALUES
('0200',2,3);
INSERT INTO HENRY_INVENTORY
VALUES
('0378',3,2);
INSERT INTO HENRY_INVENTORY
VALUES
('079X',2,1);
INSERT INTO HENRY_INVENTORY
VALUES
('079X',3,2);
INSERT INTO HENRY_INVENTORY
VALUES
('079X',4,3);
INSERT INTO HENRY_INVENTORY
VALUES
('0808',2,1);
INSERT INTO HENRY_INVENTORY
VALUES
('1351',2,4);
INSERT INTO HENRY_INVENTORY
VALUES
('1351',3,2);
INSERT INTO HENRY_INVENTORY
VALUES
('1382',2,1);
INSERT INTO HENRY_INVENTORY
VALUES
('138X',2,3);
INSERT INTO HENRY_INVENTORY
VALUES
('2226',1,3);
INSERT INTO HENRY_INVENTORY
VALUES
('2226',3,2);
INSERT INTO HENRY_INVENTORY
VALUES
('2226',4,1);
INSERT INTO HENRY_INVENTORY
VALUES
('2281',4,3);
INSERT INTO HENRY_INVENTORY
VALUES
('2766',3,2);
INSERT INTO HENRY_INVENTORY
VALUES
('2908',1,3);
INSERT INTO HENRY_INVENTORY
VALUES
('2908',4,1);
INSERT INTO HENRY_INVENTORY
VALUES
('3350',1,2);
INSERT INTO HENRY_INVENTORY
VALUES
('3743',2,1);
INSERT INTO HENRY_INVENTORY
VALUES
('3906',2,1);
INSERT INTO HENRY_INVENTORY
VALUES
('3906',3,2);
INSERT INTO HENRY_INVENTORY
VALUES
('5163',1,1);
INSERT INTO HENRY_INVENTORY
VALUES
('5790',4,2);
INSERT INTO HENRY_INVENTORY
VALUES
('6128',2,4);
INSERT INTO HENRY_INVENTORY
VALUES
('6128',3,3);
INSERT INTO HENRY_INVENTORY
VALUES
('6328',2,2);
INSERT INTO HENRY_INVENTORY
VALUES
('669X',1,1);
INSERT INTO HENRY_INVENTORY
VALUES
('6908',2,2);
INSERT INTO HENRY_INVENTORY
VALUES
('7405',3,2);
INSERT INTO HENRY_INVENTORY
VALUES
('7443',4,1);
INSERT INTO HENRY_INVENTORY
VALUES
('7559',2,2);
INSERT INTO HENRY_INVENTORY
VALUES
('8092',3,1);
INSERT INTO HENRY_INVENTORY
VALUES
('8720',1,3);
INSERT INTO HENRY_INVENTORY
VALUES
('9611',1,2);
INSERT INTO HENRY_INVENTORY
VALUES
('9627',3,5);
INSERT INTO HENRY_INVENTORY
VALUES
('9627',4,2);
INSERT INTO HENRY_INVENTORY
VALUES
('9701',1,2);
INSERT INTO HENRY_INVENTORY
VALUES
('9701',2,1);
INSERT INTO HENRY_INVENTORY
VALUES
('9701',3,3);
INSERT INTO HENRY_INVENTORY
VALUES
('9701',4,2);
INSERT INTO HENRY_INVENTORY
VALUES
('9882',3,3);
INSERT INTO HENRY_INVENTORY
VALUES
('9883',2,3);
INSERT INTO HENRY_INVENTORY
VALUES
('9883',4,2);
INSERT INTO HENRY_INVENTORY
VALUES
('9931',1,2);
INSERT INTO HENRY_PUBLISHER
VALUES
('AH','Arkham House','Sauk City WI');
INSERT INTO HENRY_PUBLISHER
VALUES
('AP','Arcade Publishing','New York');
INSERT INTO HENRY_PUBLISHER
VALUES
('BA','Basic Books','Boulder CO');
INSERT INTO HENRY_PUBLISHER
VALUES
('BP','Berkley Publishing','Boston');
INSERT INTO HENRY_PUBLISHER
VALUES
('BY','Back Bay Books','New York');
INSERT INTO HENRY_PUBLISHER
VALUES
('CT','Course Technology','Boston');
INSERT INTO HENRY_PUBLISHER
VALUES
('FA','Fawcett Books','New York');
INSERT INTO HENRY_PUBLISHER
VALUES
('FS','Farrar Straus and Giroux','New York');
INSERT INTO HENRY_PUBLISHER
VALUES
('HC','HarperCollins Publishers','New York');
INSERT INTO HENRY_PUBLISHER
VALUES
('JP','Jove Publications','New York');
INSERT INTO HENRY_PUBLISHER
VALUES
('JT','Jeremy P. Tarcher','Los Angeles');
INSERT INTO HENRY_PUBLISHER
VALUES
('LB','Lb Books','New York');
INSERT INTO HENRY_PUBLISHER
VALUES
('MP','McPherson and Co.','Kingston');
INSERT INTO HENRY_PUBLISHER
VALUES
('PE','Penguin USA','New York');
INSERT INTO HENRY_PUBLISHER
VALUES
('PL','Plume','New York');
INSERT INTO HENRY_PUBLISHER
VALUES
('PU','Putnam Publishing Group','New York');
INSERT INTO HENRY_PUBLISHER
VALUES
('RH','Random House','New York');
INSERT INTO HENRY_PUBLISHER
VALUES
('SB','Schoken Books','New York');
INSERT INTO HENRY_PUBLISHER
VALUES
('SC','Scribner','New York');
INSERT INTO HENRY_PUBLISHER
VALUES
('SS','Simon and Schuster','New York');
INSERT INTO HENRY_PUBLISHER
VALUES
('ST','Scholastic Trade','New York');
INSERT INTO HENRY_PUBLISHER
VALUES
('TA','Taunton Press','Newtown CT');
INSERT INTO HENRY_PUBLISHER
VALUES
('TB','Tor Books','New York');
INSERT INTO HENRY_PUBLISHER
VALUES
('TH','Thames and Hudson','New York');
INSERT INTO HENRY_PUBLISHER
VALUES
('TO','Touchstone Books','Westport CT');
INSERT INTO HENRY_PUBLISHER
VALUES
('VB','Vintage Books','New York');
INSERT INTO HENRY_PUBLISHER
VALUES
('WN','W.W. Norton','New York');
INSERT INTO HENRY_PUBLISHER
VALUES
('WP','Westview Press','Boulder CO');
INSERT INTO HENRY_WROTE
VALUES
('0180',3,1);
INSERT INTO HENRY_WROTE
VALUES
('0189',5,1);
INSERT INTO HENRY_WROTE
VALUES
('0200',18,1);
INSERT INTO HENRY_WROTE
VALUES
('0378',11,1);
INSERT INTO HENRY_WROTE
VALUES
('079X',4,1);
INSERT INTO HENRY_WROTE
VALUES
('0808',4,1);
INSERT INTO HENRY_WROTE
VALUES
('1351',6,1);
INSERT INTO HENRY_WROTE
VALUES
('1382',23,2);
INSERT INTO HENRY_WROTE
VALUES
('1382',25,1);
INSERT INTO HENRY_WROTE
VALUES
('138X',1,1);
INSERT INTO HENRY_WROTE
VALUES
('2226',15,1);
INSERT INTO HENRY_WROTE
VALUES
('2281',9,2);
INSERT INTO HENRY_WROTE
VALUES
('2281',19,1);
INSERT INTO HENRY_WROTE
VALUES
('2766',20,1);
INSERT INTO HENRY_WROTE
VALUES
('2908',17,1);
INSERT INTO HENRY_WROTE
VALUES
('3350',2,1);
INSERT INTO HENRY_WROTE
VALUES
('3743',16,1);
INSERT INTO HENRY_WROTE
VALUES
('3906',24,1);
INSERT INTO HENRY_WROTE
VALUES
('5163',20,1);
INSERT INTO HENRY_WROTE
VALUES
('5790',10,1);
INSERT INTO HENRY_WROTE
VALUES
('6128',1,1);
INSERT INTO HENRY_WROTE
VALUES
('6328',14,1);
INSERT INTO HENRY_WROTE
VALUES
('669X',7,1);
INSERT INTO HENRY_WROTE
VALUES
('6908',16,1);
INSERT INTO HENRY_WROTE
VALUES
('7405',20,1);
INSERT INTO HENRY_WROTE
VALUES
('7443',15,1);
INSERT INTO HENRY_WROTE
VALUES
('7559',18,1);
INSERT INTO HENRY_WROTE
VALUES
('8092',12,1);
INSERT INTO HENRY_WROTE
VALUES
('8720',8,1);
INSERT INTO HENRY_WROTE
VALUES
('9611',5,2);
INSERT INTO HENRY_WROTE
VALUES
('9611',6,1);
INSERT INTO HENRY_WROTE
VALUES
('9627',1,1);
INSERT INTO HENRY_WROTE
VALUES
('9701',20,1);
INSERT INTO HENRY_WROTE
VALUES
('9882',4,1);
INSERT INTO HENRY_WROTE
VALUES
('9883',16,1);
INSERT INTO HENRY_WROTE
VALUES
('9931',13,1);