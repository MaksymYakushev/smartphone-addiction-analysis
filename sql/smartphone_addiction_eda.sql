/************************************************************
 * File:    smartphone_addiction_eda.sql
 * Author:  Maksym Yakushev
 * Date:    2026-06-08
  * Purpose: Exploratory Data Analysis — Smartphone Addiction
 ************************************************************/


-- ============================================================
-- 1. RAW DATA PREVIEW
-- ============================================================

SELECT
	*
FROM smartphone
LIMIT 10;


-- ============================================================
-- 2. BASIC PROFILING
-- ============================================================

SELECT
	COUNT(*) AS cnt_rows
	, COUNT(DISTINCT transaction_id) AS unq_transactions
	, COUNT(DISTINCT user_id) AS cnt_users
	, COUNT(DISTINCT gender) AS cnt_gender
	, COUNT(DISTINCT stress_level) AS cnt_stress_level
	, COUNT(DISTINCT addiction_level) AS cnt_addiction_level
FROM smartphone;

	
-- ============================================================
-- 3. DATA QUALITY CHECK
-- ============================================================

SELECT
	'Age' AS column
	, MIN(age) AS min
	, MAX(age) AS max
	, ROUND(AVG(age), 0) AS avg
FROM smartphone

UNION

SELECT
	'Daily screen time' AS column
	, MIN(daily_screen_time_hours) AS min
	, MAX(daily_screen_time_hours) AS max
	, AVG(daily_screen_time_hours) AS avg
FROM smartphone

UNION 

SELECT
	'Social media' AS column
	, MIN(social_media_hours) AS min
	, MAX(social_media_hours) AS max
	, AVG(social_media_hours) AS avg
FROM smartphone

UNION

SELECT
	'Gaming hours' AS column
	, MIN(gaming_hours) AS min
	, MAX(gaming_hours) AS max
	, AVG(gaming_hours) AS avg
FROM smartphone

UNION 

SELECT
	'Work study hours' AS column
	, MIN(work_study_hours) AS min
	, MAX(work_study_hours) AS max
	, AVG(work_study_hours) AS avg
FROM smartphone

UNION

SELECT
	'Sleep hours' AS column
	, MIN(sleep_hours) AS min
	, MAX(sleep_hours) AS max
	, AVG(sleep_hours) AS avg
FROM smartphone

UNION

SELECT
	'Notifications per day' AS column
	, MIN(notifications_per_day) AS min
	, MAX(notifications_per_day) AS max
	, AVG(notifications_per_day) AS avg
FROM smartphone

UNION

SELECT
	'App opens per day' AS column
	, MIN(app_opens_per_day) AS min
	, MAX(app_opens_per_day) AS max
	, AVG(app_opens_per_day) AS avg	
FROM smartphone

UNION

SELECT
	'Weekend screen time' AS column
	, MIN(weekend_screen_time) AS min
	, MAX(weekend_screen_time) AS max
	, AVG(weekend_screen_time) AS avg
FROM smartphone;


-- ============================================================
-- 4. DISTINCT VALUES — INDIVIDUAL COLUMNS
-- ============================================================

-- gender
SELECT
	DISTINCT gender
FROM smartphone;

-- stress_level
SELECT
	DISTINCT stress_level
FROM smartphone;

-- academic_work_impact
SELECT
	DISTINCT academic_work_impact
FROM smartphone;

-- addiction_level
SELECT
	DISTINCT addiction_level
FROM smartphone;

-- addicted_label
SELECT
	DISTINCT addicted_label
FROM smartphone;


-- ============================================================
-- 5. NULLS CHECK
-- ============================================================

SELECT
	COUNT(*) FILTER(WHERE transaction_id IS NULL) AS transaction_id_null
	, COUNT(*) FILTER(WHERE user_id IS NULL) AS user_id_null
	, COUNT(*) FILTER(WHERE age IS NULL) AS age_null
	, COUNT(*) FILTER(WHERE gender IS NULL) AS gender_null
	, COUNT(*) FILTER(WHERE daily_screen_time_hours IS NULL) AS daily_screen_time_hours_null
	, COUNT(*) FILTER(WHERE social_media_hours IS NULL) AS social_media_hours_null
	, COUNT(*) FILTER(WHERE gaming_hours IS NULL) AS gaming_hours_null
	, COUNT(*) FILTER(WHERE work_study_hours IS NULL) AS work_study_hours_null
	, COUNT(*) FILTER(WHERE sleep_hours IS NULL) AS sleep_hours_null
	, COUNT(*) FILTER(WHERE notifications_per_day IS NULL) AS notifications_per_day_null
	, COUNT(*) FILTER(WHERE app_opens_per_day IS NULL) AS app_opens_per_day_null
	, COUNT(*) FILTER(WHERE weekend_screen_time IS NULL) AS weekend_screen_time_null
	, COUNT(*) FILTER(WHERE stress_level IS NULL) AS stress_level_null
	, COUNT(*) FILTER(WHERE academic_work_impact IS NULL) AS academic_work_impact_null
	, COUNT(*) FILTER(WHERE addiction_level IS NULL) AS addiction_level_null
	, COUNT(*) FILTER(WHERE addicted_label IS NULL) AS addicted_label_null
FROM smartphone; 


-- ============================================================
-- 6. DUPLICATES CHECK
-- ============================================================

SELECT
	transaction_id 
	, user_id
	, COUNT(*) AS cnt
FROM smartphone
GROUP BY 
	transaction_id 
	, user_id
HAVING 	
	COUNT(*) > 1;

