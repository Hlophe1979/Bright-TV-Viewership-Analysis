-- Checking the first 100 rows from both tables separately
select * from `bright_tv_viewership`.`bright_tv_analysis`.`user_profiles` limit 100;

select * from `bright_tv_viewership`.`bright_tv_analysis`.`viewership` limit 100;



-- A) Exploratory Data Analysis (EDA)

-------------------------------------------------------------------------------------------------------------------------
-- 1.Combining thw two tables into one table
-------------------------------------------------------------------------------------------------------------------------
SELECT x.UserID0,
        x.Channel2,
        x.RecordDate2,
        x.`Duration 2`,

        y.Gender,
        y.Race,
        y.Age,
        y.Province

FROM  `bright_tv_viewership`.`bright_tv_analysis`.`viewership` AS x
FULL OUTER JOIN `bright_tv_viewership`.`bright_tv_analysis`.`user_profiles` AS y
ON x.UserID0 = y.UserID;

-------------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------------------
-- 2. Checking the maximum and minimum dates of the RecordDate2 column as well as their differences
-------------------------------------------------------------------------------------------------------------------------
SELECT  MAX(RecordDate2) AS max_date,
        MIN(RecordDate2) AS min_date,
        DATEDIFF(DAY, MIN(RecordDate2), MAX(RecordDate2)) AS difference_in_days
       
FROM  `bright_tv_viewership`.`bright_tv_analysis`.`viewership`;

---------------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------------------
-- 3. Checking the names of the channels along with a number of channels we have
-------------------------------------------------------------------------------------------------------------------------
SELECT  DISTINCT Channel2        
FROM  `bright_tv_viewership`.`bright_tv_analysis`.`viewership`;


SELECT  COUNT(DISTINCT Channel2) AS no_of_channels       
FROM  `bright_tv_viewership`.`bright_tv_analysis`.`viewership`;

-- we have 21 different channels

---------------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------------------
-- 4. Checking the names of the Provinces and number of Provinces we have
-------------------------------------------------------------------------------------------------------------------------
SELECT  DISTINCT Province        
FROM  `bright_tv_viewership`.`bright_tv_analysis`.`user_profiles`;


SELECT  COUNT(DISTINCT Province) AS no_of_provinces      
FROM  `bright_tv_viewership`.`bright_tv_analysis`.`user_profiles`;


-- we got views from 11 different provinces

---------------------------------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------------------------------
-- 5. Checking the Minimum, Maximum , and average Duration times
---------------------------------------------------------------------------------------------------------------------------
SELECT MAX(`Duration 2`) AS max_duration,
        MIN(`Duration 2`) AS min_duration,
        AVG(`Duration 2`) AS average_duration
FROM `bright_tv_viewership`.`bright_tv_analysis`.`viewership`;

---------------------------------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------------------------------
-- 6. Checking different races of our viewers
---------------------------------------------------------------------------------------------------------------------------
SELECT  DISTINCT Race        
FROM `bright_tv_viewership`.`bright_tv_analysis`.`user_profiles`;


SELECT  COUNT(DISTINCT Race) AS num_of_races     
FROM `bright_tv_viewership`.`bright_tv_analysis`.`user_profiles`;

---------------------------------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------------------------------
-- 7. Checking if the NULL values exist in the Age AND Race columns
---------------------------------------------------------------------------------------------------------------------------
SELECT Gender,
        Race
FROM `bright_tv_viewership`.`bright_tv_analysis`.`user_profiles`
WHERE Gender IS NULL
OR Race IS NULL;

-- Hence, No NULL values exist within these columns

---------------------------------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------------------------------
-- 8. Replacing the Null values of the Age column with 0
---------------------------------------------------------------------------------------------------------------------------
SELECT Age,
        IFNULL(Age, 0) AS replaced_age
FROM `bright_tv_viewership`.`bright_tv_analysis`.`user_profiles`;

SELECT Gender,
        IFNULL(Gender, 'Unfilled') AS replaced_gender
FROM `bright_tv_viewership`.`bright_tv_analysis`.`user_profiles`;

---------------------------------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------------------------------
-- 9. Checking the Hour, Dayname and Monthname of the RecordDate2 column
---------------------------------------------------------------------------------------------------------------------------
SELECT RecordDate2,
        Hour(RecordDate2) AS hour_of_record,
        Dayname(RecordDate2) AS day_of_record,
        Monthname(RecordDate2) AS month_of_record
FROM `bright_tv_viewership`.`bright_tv_analysis`.`viewership`;

---------------------------------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------------------------------
-- 10. Calculating the number of viwers Per Channel
---------------------------------------------------------------------------------------------------------------------------
SELECT Channel2,
        COUNT(UserID0) AS viewers_per_channel
FROM  `bright_tv_viewership`.`bright_tv_analysis`.`viewership`
GROUP BY Channel2;

-- 10.1 Calculating the total duration time per channel
SELECT Channel2,
        SUM(`Duration 2`) AS total_duration_per_channel
FROM  `bright_tv_viewership`.`bright_tv_analysis`.`viewership`
GROUP BY Channel2;

---------------------------------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------------------------------
-- 11. Calculating the number of viwers Per Race
---------------------------------------------------------------------------------------------------------------------------
SELECT Race,
        COUNT(UserID) AS viewers_per_race
FROM `bright_tv_viewership`.`bright_tv_analysis`.`user_profiles`
GROUP BY Race;

---------------------------------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------------------------------
-- 12. Calculating the number of viwers Per Province
---------------------------------------------------------------------------------------------------------------------------
SELECT Province,
        COUNT(UserID) AS viewers_per_province
FROM `bright_tv_viewership`.`bright_tv_analysis`.`user_profiles`
GROUP BY Province;

---------------------------------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------------------------------
-- 13. Calculating the number of viwers Per Gender
---------------------------------------------------------------------------------------------------------------------------
SELECT Gender,
        COUNT(UserID) AS viewers_per_gender
FROM `bright_tv_viewership`.`bright_tv_analysis`.`user_profiles`
GROUP BY Gender;

---------------------------------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------------------------------
-- 14. Checking the Age of our youngest and oldest viewer
---------------------------------------------------------------------------------------------------------------------------
SELECT MAX(Age) AS oldest_viewer,
       MIN(Age) AS youngest_viewer
FROM `bright_tv_viewership`.`bright_tv_analysis`.`user_profiles`;

---------------------------------------------------------------------------------------------------------------------------


-- B) Data Processing, to gain more insights

SELECT x.UserID0,
        x.Channel2,
        x.RecordDate2,
        x.`Duration 2`,

        y.Gender,
        y.Race,
        y.Age,
        y.Province,

-- Adding columns to enhance the insights about the Record Date
        Year(RecordDate2) AS year_of_rec,
        Dayname(RecordDate2) AS day_of_rec,
        Monthname(RecordDate2) AS month_of_rec,
        Dayofmonth(RecordDate2) AS month_day_of_rec,
        Hour(RecordDate2) AS hour_of_rec,

-- Classifying the weekdays from the weekends of the Record Date
        CASE
                WHEN Dayname(RecordDate2) IN ('Sat', 'Sun') THEN 'Weekend'
                ELSE 'Weekday'
        END AS day_classification,

-- Adding the column for time buckets
        CASE
                WHEN date_format(RecordDate2, 'HH:MM:SS') BETWEEN '06:00:00' AND '11:59:59' THEN 'Morning'
                WHEN date_format(RecordDate2, 'HH:MM:SS') BETWEEN '12:00:00' AND '17:59:59' THEN 'Afternoon'
                WHEN date_format(RecordDate2, 'HH:MM:SS') BETWEEN '18:00:00' AND '23:59:59' THEN 'Evening'
                WHEN date_format(RecordDate2, 'HH:MM:SS') BETWEEN '00:00:00' AND '05:59:59' THEN 'Midnight'
        END AS time_buckets,

-- Adding column to classify the age
        CASE
                WHEN Age BETWEEN 0 AND 12 THEN 'Little Kid'
                WHEN Age BETWEEN 13 AND 19 THEN 'Teenager'
                WHEN Age BETWEEN 20 AND 29 THEN 'Young Adult'
                WHEN Age BETWEEN 30 AND 40 THEN 'Grown Adult'
                WHEN Age BETWEEN 40 AND 59 THEN 'Middle-aged'
                WHEN Age >= 60 THEN 'Senior Citizen'

        END AS age_classification

FROM  `bright_tv_viewership`.`bright_tv_analysis`.`viewership` AS x
FULL OUTER JOIN `bright_tv_viewership`.`bright_tv_analysis`.`user_profiles` AS y
ON x.UserID0 = y.UserID;

-------------------------------------------------------------------------------------------------------------------------







