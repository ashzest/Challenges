DELIMITER $$

CREATE PROCEDURE q1(
	 IN symboltext varchar(5)
     )
BEGIN 
	set @counter = 0;
    SELECT (@counter := @counter + 1) AS Count, `<ticker>` AS Ticker FROM sample_dataset1
    WHERE `<ticker>`LIKE symboltext;
    END $$
    

