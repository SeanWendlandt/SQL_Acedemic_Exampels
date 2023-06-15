-- Lab 8 --

                     -- Part 1 --
-- call myCreateTable(100000) runtime 138.688 seconds --
--  CALL mySelectTest(50, 1000) runtime: 3.000 --

-- call myCreateTable(100000) with index 134.922 seconds --
--  CALL mySelectTest(50, 1000) with index runtime: .063 --



drop procedure if exists myCreateTable;
drop procedure if exists mySelectTest;
DROP TABLE IF EXISTS RandomNums;


delimiter //
CREATE PROCEDURE myCreateTable(IN paramiter int)
BEGIN
DECLARE i INT;
SET i = 0;

create table RandomNums
      (
      Id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
      feild int,
      INDEX(feild)
      );

WHILE i < paramiter DO
	insert into RandomNums(feild) VALUES(FLOOR(RAND() * 1000));
	SET i = i+1;
END WHILE;
END;
//

delimiter ;
call myCreateTable(100000);


delimiter //
CREATE PROCEDURE mySelectTest(IN TARGET INT, IN NUM_RUN INT)
BEGIN
	DECLARE counter INT DEFAULT 0;
    DECLARE total_rows INT DEFAULT 0;
    
	WHILE counter < NUM_RUN DO
		SELECT COUNT(*) INTO total_rows
		FROM RandomNums
		WHERE feild = TARGET;
		SET counter = counter + 1;
	END WHILE;
END //
delimiter ;

 CALL myCreateTable(100000); 
 CALL mySelectTest(50, 1000);
 
 
              -- Part 2 --

DROP TABLE IF EXISTS candy_matview;
DROP TRIGGER IF EXISTS candy_trigger;

CREATE TABLE candy_matview(
	cust_name VARCHAR(30),
    cust_type_desc VARCHAR(10),
    prod_desc VARCHAR(30),
    pounds FLOAT
    );
    
INSERT INTO candy_matview (cust_name, cust_type_desc, prod_desc, pounds)
	(SELECT cc.cust_name, cct.cust_type_desc, cpd.prod_desc, cp.pounds
    FROM candy_purchase cp 
    JOIN candy_customer cc ON cp.cust_id = cc.cust_id
    JOIN candy_cust_type cct ON cc.cust_type = cct.cust_type
    JOIN candy_product cpd ON cp.prod_id = cpd.prod_id
    );
    
DELIMITER // 
CREATE TRIGGER candy_trigger
	AFTER INSERT ON candy_purchase 
    FOR EACH ROW
    BEGIN
		 INSERT INTO candy_matview
			VALUES ((SELECT cust_name FROM candy_customer WHERE cust_id = NEW.cust_id), 
					(SELECT cct.cust_type_desc FROM candy_cust_type cct WHERE cust_type = (SELECT cust_type from candy_customer cc WHERE cc.cust_id = NEW.cust_id)),
                    (SELECT prod_desc FROM candy_product WHERE prod_id = NEW.prod_id),
                    (SELECT NEW.pounds)
                    );
    END // 
DELIMITER ;

INSERT INTO candy_purchase VALUES 
 (100, 
 (select prod_id from candy_product where prod_desc = 'Nuts Not Nachos'), 
 (select cust_id from candy_customer where cust_name = 'The Candy Kid'), 
 '2020-11-2',
 '2020-11-6',
 5.2,
 'PAID');

SELECT * FROM candy_matview;

