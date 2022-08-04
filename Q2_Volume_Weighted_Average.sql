
DELIMITER $$
CREATE PROCEDURE Volume_Weighted_Average_Q2(
	IN date_input varchar(30)
)
BEGIN
    SET @timeplus = 5;
	create temporary table t1
	SELECT (`<low>`+`<high>`+ `<close>`)/3*`<vol>`as price_volume, `<vol>`, 
	STR_TO_DATE(`<date>`,'%Y%m%d%H%i') AS start_date, 
    DATE_ADD(str_to_date(@date_input, '%Y-%m-%d %T'), INTERVAL @timeplus HOUR) as end_date
	FROM sample_dataset2
	WHERE str_to_date(`<date>`,'%Y%m%d%H%i') BETWEEN
	str_to_date(@date_input, '%Y-%m-%d %T') AND 
	DATE_ADD(str_to_date(@date_input, '%Y-%m-%d %T'), INTERVAL @timeplus HOUR );
    
    select * from t1; 
    select sum(price_volume)/sum(`<vol>`) as VWAP from t1; 
    
	
END $$
DELIMITER ;

   -- drop procedure Volume_Weighted_Average_Q2;
   -- drop temporary table t1;