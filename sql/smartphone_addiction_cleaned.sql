/************************************************************
 * File:    smartphone_addiction_eda.sql
 * Author:  Maksym Yakushev
 * Date:    2026-06-08
  * Purpose: Cleaned dataset for analysis and visualization
 ************************************************************/


-- ============================================================
-- 1. DATA PREVIEW
-- ============================================================

SELECT
	*
FROM smartphone
LIMIT 10;


-- ============================================================
-- 2. CLEANED DATASET – VIEW
-- ============================================================

CREATE VIEW smartphone_addiction_cleaned AS
SELECT *
FROM (
    SELECT
        *
    FROM smartphone
    WHERE 
		gender IN ('Male', 'Female')
) AS t;


-- ============================================================
-- 3. CLEANED DATASET – PREVIEW
-- ============================================================

SELECT 
	* 
FROM smartphone_addiction_cleaned;

