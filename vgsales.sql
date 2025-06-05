show databases;
create database videogamesales;
use videogamesales;

create table games (
    Ranking int,
    Name varchar(255),
    Platform varchar(50),
    Year int,
    Genre varchar(50),
    Publisher varchar(50),
    NA_Sales decimal(10,2),
    EU_Sales decimal(10,2),
    JP_Sales decimal(10,2),
    Other_Sales decimal(10,2),
    Global_Sales decimal(10,2)
);

select * from games;

# total number of games in the dataset
select count(*) as totalgames from games;

# top 10 globally selling games with name ranking platform year genre and global sales
select Ranking, Name, Platform, Year, Genre, Global_Sales from games order by Global_Sales desc limit 10;


# total sales based on regions
select 
sum(NA_Sales) as North_America,
sum(EU_Sales) as European_Countries,
sum(JP_Sales) as Japan,
sum(Other_Sales) as Other_Countries,
sum(Global_Sales) as Globally
from games;

# top 5 games sold in north america
select * from games order by NA_Sales desc limit 5;

# top 5 games sold in Japan
select * from games order by JP_Sales desc limit 5;

# top sales globally based on genre
select Genre, sum(Global_Sales) as Total_Sales
from games group by Genre order by Total_Sales desc;

# average sales based on publisher top 10
select Publisher, avg(Global_Sales) as Average_Sales
from games group by Publisher order by Average_Sales desc limit 10;

# games released based on year
select Year, count(*) as games_released
from games group by Year order by Year;

# top 5 games selling games in 2008 
select Ranking, Name, Platform, Year, Genre, Publisher, Global_Sales
from games where Year = 2008 order by Global_Sales desc limit 5; 

# top 5 selling publisher globally based on genre
select Publisher, Genre, sum(Global_Sales) as Total_Global_Sales
from games
group by Publisher, Genre
order by Total_Global_Sales desc limit 5;

# top 5 selling publisher globally excluding genre
select Publisher, sum(Global_Sales) as Total_Global_Sales
from games
group by Publisher order by Total_Global_Sales desc limit 5;

# top 5 publisher by total sales per region
select Publisher,
       sum(NA_Sales) as NA_Total,
       sum(EU_Sales) as EU_Total,
       sum(JP_Sales) as JP_Total,
       sum(Global_Sales) as Global_Total
from games
group by Publisher
order by Global_Total desc limit 5;


# sales trending over years
select Year, sum(Global_Sales) as Yearly_Sales
from games where Year IS NOT NULL group by Year order by Year;




	




