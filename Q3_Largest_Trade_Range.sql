DELIMITER $$
create procedure Largest_Price_Range_Q3()
begin
	create temporary table t1 as
		select 
		STR_TO_DATE(`Date`,'%m/%d/%Y') as 'Date_1', 
		max(abs(`open`-`close`)) as 'Trade_Range'
		from sample_dataset3
		group by Date_1
		order by Trade_Range desc limit 3;

	create temporary table t2 as
		select 
		STR_TO_DATE(`Date`,'%m/%d/%Y') as 'Date_2', 
		max(high) as Maximum_Price from sample_dataset3
		where Date in (select Date from t1)
		group by Date;

	create temporary table t3 as
		select STR_TO_DATE(`Date`,'%m/%d/%Y') as 'Date_3',
		STR_TO_DATE(`Time`,'%H%i') as Time_of_max_Price, max(high) as MaxP from sample_dataset3
		where high in (select Maximum_Price from t2)
		group by Date_3;

	select * from t1;
	select * from t2;
	select * from t3;

	select t3.Date_3,t3.Time_of_max_Price, t1.Trade_Range
	from t3
	inner join t1
	on t3.Date_3= t1.Date_1;
end $$ 
DELIMITER ;
-- drop procedure Largest_Price_Range_Q3;
-- drop temporary table t1;
-- drop temporary table t2;
-- drop temporary table t3;