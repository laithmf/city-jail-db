-- ============================================================
-- City Jail Database — Assignment Queries (Part 2)
-- Course: CSC4710  |  Winter 2023
-- Database: MySQL (city_jail)
-- ============================================================

USE city_jail;

-- ============================================================
-- Q1 / Q6: Officers who reported more than the average number
--          of crimes
-- ============================================================
SELECT
    o.officer_id,
    CONCAT(o.first, ' ', o.last) AS officer_name
FROM officers o
INNER JOIN crime_officers co ON co.officer_id = o.officer_id
GROUP BY o.officer_id, o.first, o.last
HAVING COUNT(co.crime_id) > (
    SELECT AVG(c)
    FROM (
        SELECT COUNT(crime_id) AS c
        FROM crime_officers
        GROUP BY officer_id
    ) AS t
);

-- ============================================================
-- Q2 / Q7: Criminals with fewer-than-average crimes who are
--          NOT listed as violent offenders
-- ============================================================
SELECT
    c.criminal_id,
    CONCAT(c.first, ' ', c.last) AS criminal_name
FROM criminals c
LEFT JOIN (
    SELECT criminal_id, COUNT(*) AS num_crimes
    FROM crimes
    GROUP BY criminal_id
) AS crime_counts ON crime_counts.criminal_id = c.criminal_id
WHERE c.v_status = 'N'
GROUP BY c.criminal_id, criminal_name
HAVING COALESCE(SUM(crime_counts.num_crimes), 0) < (
    SELECT AVG(num_crimes)
    FROM (
        SELECT COUNT(*) AS num_crimes
        FROM crimes
        GROUP BY criminal_id
    ) AS t
);

-- ============================================================
-- Q3 / Q8: Appeals with fewer-than-average days between
--          filing date and hearing date
-- ============================================================
SELECT
    appeal_id,
    crime_id,
    filing_date,
    hearing_date,
    status,
    DATEDIFF(hearing_date, filing_date) AS days_to_hearing
FROM appeals
WHERE DATEDIFF(hearing_date, filing_date) < (
    SELECT AVG(DATEDIFF(hearing_date, filing_date))
    FROM appeals
    WHERE hearing_date IS NOT NULL
      AND filing_date  IS NOT NULL
);

-- ============================================================
-- Q4: Probation officers with fewer-than-average criminals
--     assigned to them
-- ============================================================
SELECT
    po.prob_id,
    CONCAT(po.first, ' ', po.last) AS prob_officer_name
FROM prob_officers po
LEFT JOIN sentences s ON s.prob_id = po.prob_id
GROUP BY po.prob_id, prob_officer_name
HAVING COUNT(s.criminal_id) < (
    SELECT AVG(cnt)
    FROM (
        SELECT COUNT(criminal_id) AS cnt
        FROM sentences
        WHERE prob_id IS NOT NULL
        GROUP BY prob_id
    ) AS t
);

-- ============================================================
-- Q5: Crime(s) with the highest number of appeals on record
-- ============================================================
SELECT
    c.crime_id,
    c.criminal_id,
    c.classification,
    c.status,
    COUNT(a.appeal_id) AS appeal_count
FROM crimes c
JOIN appeals a ON a.crime_id = c.crime_id
GROUP BY c.crime_id, c.criminal_id, c.classification, c.status
HAVING COUNT(a.appeal_id) = (
    SELECT MAX(appeal_count)
    FROM (
        SELECT COUNT(appeal_id) AS appeal_count
        FROM appeals
        GROUP BY crime_id
    ) AS t
);

-- ============================================================
-- Q9: Alphabetical list of all criminals with aliases
--     (correct answer: LEFT OUTER JOIN)
-- ============================================================
SELECT
    c.criminal_id,
    c.last,
    c.first,
    c.v_status,
    c.p_status,
    a.alias
FROM criminals c
LEFT OUTER JOIN aliases a ON c.criminal_id = a.criminal_id
ORDER BY c.last, c.first;

-- ============================================================
-- Q10: Full table dumps (all attributes)
-- ============================================================
SELECT * FROM criminals;
SELECT * FROM crimes;
SELECT * FROM aliases;
SELECT * FROM sentences;
SELECT * FROM prob_officers;
SELECT * FROM officers;
SELECT * FROM crime_codes;
SELECT * FROM appeals;
SELECT * FROM crime_officers;
SELECT * FROM crime_charges;
SELECT * FROM prob_contact;
SELECT * FROM criminals_dw;
