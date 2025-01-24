use hr;

-- Average Attrition rate for all Departments (KPI 1)
SELECT Department, 
concat((SUM(CASE WHEN Attrition="Yes" then 1 else 0 end)/sum(EmployeeCount))*100,"%")as Avg_Attrition
from hr_data
group by Department
order by Department;

-- Average Hourly rate of Male Research Scientist (KPI 2)
SELECT JobRole, AVG(HourlyRate) AS Avg_Hourly_Rate
from hr_data
where Gender="Male" and JobRole="Research Scientist";

-- Attrition rate Vs Monthly income stats  (KPI 3)
Select 
   case 
    when MonthlyIncome>1000 and MonthlyIncome<6000 then '1000-5999'
    when MonthlyIncome>=6000 and MonthlyIncome<11000 then '6000-10999'
    when MonthlyIncome>=11000 and MonthlyIncome<16000 then '11000-15999'
    when MonthlyIncome>=16000 and MonthlyIncome<21000 then '16000-20999'
    when MonthlyIncome>=21000 and MonthlyIncome<26000 then '21000-25999'
	when MonthlyIncome>=26000 and MonthlyIncome<31000 then '26000-30999'
	when MonthlyIncome>=31000 and MonthlyIncome<36000 then '31000-35999'
	when MonthlyIncome>=36000 and MonthlyIncome<41000 then '36000-40999'
	when MonthlyIncome>=41000 and MonthlyIncome<46000 then '41000-45999'
	when MonthlyIncome>=46000 and MonthlyIncome<56000 then '41000-50999'
    else 0
    end as Income_Bin,
    concat((SUM(CASE WHEN Attrition="Yes" then 1 else 0 end)/sum(EmployeeCount))*100,"%")as Avg_Attrition
    from hr_data
    group by Income_Bin
    order by Income_Bin;
    
    -- Average working years for each Department  (KPI 4)
SELECT Department, avg(YearsAtCompany) as  avg_work_year 
from hr_data
group by Department
order by Department;

-- Job Role Vs Work life balance  (KPI 5)
select JobRole,
    count(case when worklifebalance=4 then EmployeeCount  end ) "Excellent",
    count(case when worklifebalance=3 then EmployeeCount  end ) "Good",
    count(case when worklifebalance=2 then EmployeeCount end ) "Average",
    count(case when worklifebalance=1 then EmployeeCount  end ) "Poor"
    from hr_data
group by JobRole
order by JobRole;

-- Attrition rate Vs Year since last promotion relation  (KPI 6)
SELECT CASE
       WHEN YearsSinceLastPromotion>=1 AND YearsSinceLastPromotion<=5 THEN "1-5"
       WHEN YearsSinceLastPromotion>=6 AND YearsSinceLastPromotion<=10 THEN "6-10"
       WHEN YearsSinceLastPromotion>=11 AND YearsSinceLastPromotion<=15 THEN "11-15"
       WHEN YearsSinceLastPromotion>=16 AND YearsSinceLastPromotion<=20 THEN "16-20"
       WHEN YearsSinceLastPromotion>=21 AND YearsSinceLastPromotion<=25 THEN "21-25"
       WHEN YearsSinceLastPromotion>=26 AND YearsSinceLastPromotion<=30 THEN "26-30"
       WHEN YearsSinceLastPromotion>=31 AND YearsSinceLastPromotion<=35 THEN "31-35"
       WHEN YearsSinceLastPromotion>=36 AND YearsSinceLastPromotion<=40 THEN "36-40"
       else 0
       end as Years_Since_LastPromotion,
       concat((SUM(CASE WHEN Attrition="Yes" then 1 else 0 end)/sum(EmployeeCount))*100,"%")as Avg_Attrition
    from hr_data
    group by Years_Since_LastPromotion
    order by Years_Since_LastPromotion;


    

