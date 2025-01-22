use Rain;
select * from Rainfall;

/*Que 1. Fetch the years and states data when the annual rainfall is higher than 5000 mm.*/
select YEAR,SUBDIVISION from Rainfall where ANNUAL>5000;

/*Que 2. Fetch the years and states data when the annual rainfall is higher than 500 mm in first Quarter.*/
select YEAR,SUBDIVISION from Rainfall where (JAN+FEB+MAR)>500;

/*Que 3. Fetch the year wise Vidarbha and Gujarat Rainfall Data based on highest Rainfall.*/
select YEAR,SUBDIVISION,MAX(Annual) as max_rain_inyear from Rainfall where SUBDIVISION = 'Vidarbha' or SUBDIVISION='Gujarat REGION' group by year,SUBDIVISION order by Year, max_rain_inyear desc;

/*Que 4. Fetch the names all Subdivisions present in database.*/
select SUBDIVISION as Names_Subdivision from Rainfall Group by SUBDIVISION;

/*Que 5. Correct the spelling of 'MATATHWADA' as 'MARATHWADA' in database.*/
update Rainfall set SUBDIVISION='MARATHWADA'where SUBDIVISION='MATATHWADA';

select * from Rainfall where SUBDIVISION='MARATHWADA';

/*Que 6. Check if Annual column contains zero value as erroneous data.*/
select ANNUAL as erroneous from Rainfall where ANNUAL=0;

/*Que 7 . Update Zero values by the sum of values for 12 months.*/
update Rainfall set Annual=(JAN+FEB+MAR+APR+MAY+JUN+JUL+AUG+SEP+AUG+NOV+DEC) where ANNUAL=0;

select * from Rainfall;

/*Que 8. Fetch the Average Rainfall in each subdivision across years in database;*/
select Subdivision,Avg(Annual) as AVG_asper_Subdivision from Rainfall group by SUBDIVISION;

/*Que 9. Fetch the Top 5 Subdivisions with minimum average rainfall.*/
select top 5 SUBDIVISION ,avg(Annual) as Min_AVG_Rainfall from Rainfall group by SUBDIVISION order by Min_AVG_Rainfall;

/*Que 10 Fetch the Average Rainfall in Vidarbha and Marathwada.*/
select subdivision, avg(Annual) from Rainfall where SUBDIVISION = 'Vidarbha' or SUBDIVISION='Marathwada' group by SUBDIVISION ;

/*Que 11. How many subdivisions have rainfall between 4000 to 5000 mm?*/
select count(Distinct SUBDIVISION) as rain_fall from Rainfall where ANNUAL > 4000 and ANNUAL<5000;


/*Que 12. Fetch the Top 10 subdivisions with highest average rainfall in august.*/
select top 10 SUBDIVISION ,avg(Annual) as Max_AVG_Rainfall from Rainfall group by SUBDIVISION order by MAX_AVG_Rainfall desc;

/*Que 13. Which year has maximum rainfall in august month in Gujarat?*/
select top 1 YEAR, MAX(AUG) as max_rainfall_guj_Aug from Rainfall where SUBDIVISION='Gujarat Region' group by year order by max_rainfall_guj_Aug desc;


/*Que 14. Between years 2005 to 2015 what is the average rainfall in Gujarat July month.*/
select avg(jul) as rainfall_july_guj from Rainfall where SUBDIVISION='Gujarat Region'and  year between 2005 and 2015; 

/*Que 15. What is the difference between maximum and minimum rainfall in Gujarat annually?*/
select max(annual)-min(annual) as dif_guj_rainfall from Rainfall where SUBDIVISION='Gujarat Region';