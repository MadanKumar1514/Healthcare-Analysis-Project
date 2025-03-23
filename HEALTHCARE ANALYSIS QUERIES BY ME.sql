 
-- ALter table healthcare.patients
-- modify 'OCD Diagnosis Date' date;



#1. AVERAGE OBSESSION SCORE BY GENDER ALONG WITH COUNT
 
 WITH DATA AS (SELECT gender, 
		COUNT('patient id') as patients_count,
        AVG(`Y-BOCS Score (Compulsions)`)  avg_obs_score
 FROM HEALTHCARE.PATIENTS
 GROUP BY 1
 ORDER BY 2 DESC)
 
 
#2. DISPALY PERCENTAGE OF MALES AND FEMALES 

SELECT 
SUM(CASE WHEN GENDER='Male' THEN patients_count else 0 END ) as male_count, 
SUM(CASE WHEN GENDER='Female' THEN patients_count else 0 END) as female_count,
ROUND(SUM(CASE WHEN GENDER='Male' THEN patients_count else 0 END )/(SUM(CASE WHEN GENDER='Male' THEN patients_count else 0 END )+SUM(CASE WHEN GENDER='Female' THEN patients_count else 0 END))*100,2) as MALE_PERCENT,	 
ROUND(SUM(CASE WHEN GENDER='Female' THEN patients_count else 0 END )/(SUM(CASE WHEN GENDER='Male' THEN patients_count else 0 END )+SUM(CASE WHEN GENDER='Female' THEN patients_count else 0 END))*100,2) as FEMALE_PERCENT	 
FROM DATA



#3. COUNT OF PATIENTS BY THEIR ETHNICITY NAD THIER RESPECTIVE AVERAGE OBSESSION SCORE

SELECT Ethnicity, 
COUNT('Patient ID') as patient_count,
AVG(`Y-BOCS Score (Obsessions)`) as avg_obs_score
FROM healthcare.patients
GROUP BY 1
ORDER BY 2

# NUMBER OF PEOPLE DIAGNOSED WITH OCD MoM(MONTH OVER MONTH)



SELECT
date_format(`OCD Diagnosis Date`, '%Y-%m-01 00:00:00') as month, 
-- `OCD Diagnosis Date` as date 
COUNT(`OCD Diagnosis Date`) AS COUNT
FROM HEALTHCARE.PATIENTS
GROUP BY 1
ORDER BY 1 



select
date_format(`OCD Diagnosis Date`, '%Y-%m-01 00:00:00') as month,
-- `OCD Diagnosis Date`
count(`Patient ID`) patient_count
from HEALTHCARE.PATIENTS
group by 1
Order by 1


# WHAT IS MOST COMMON OBSESSION TYPE(COUNT) AND RESPECTIVE AVERAGE OBSESSION SCORE

WITH DATA3 AS (SELECT  `Obsession Type`, 
COUNT('patient id') AS count,
round(AVG(`Y-BOCS Score (Obsessions)`),2) as avg_obs_score
FROM HEALTHCARE.PATIENTS
GROUP BY 1 
order by 2 desc
)
SELECT *
from data3 




# WHAT IS THE MOST COMMON COMPULSION TYPE (COUNT) AND RESPECTIVE AVERAGE COMPULSION  SCORE

WITH DATA3 AS (SELECT  `Compulsion Type`, 
COUNT('patient id') AS count,
round(AVG(`Y-BOCS Score (Compulsions)`),2) as avg_comp_score
FROM HEALTHCARE.PATIENTS
GROUP BY 1  
order by 2 desc
)
SELECT *
from data3 
