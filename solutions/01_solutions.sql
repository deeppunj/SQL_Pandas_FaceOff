-- Lesson 1 solutions. Only open after you tried each question yourself.

-- Question 1
SELECT *
FROM applications
LIMIT 10;

-- Question 2 (expect 29 rows)
SELECT *
FROM applications
WHERE appl_type = 'NDA';

-- Question 3 (expect 30)
SELECT COUNT(*)
FROM applications
WHERE sponsor_name = 'TEVA';

-- Question 4 (expect 12 sponsors)
SELECT DISTINCT sponsor_name
FROM applications;

SELECT COUNT(DISTINCT sponsor_name) AS number_of_sponsors
FROM applications;

-- Question 5
SELECT drug_name, form
FROM products
WHERE form LIKE '%TABLET%'
ORDER BY drug_name
LIMIT 10;

-- Question 6 (expect 33)
SELECT COUNT(*)
FROM submissions
WHERE review_priority = 'PRIORITY';

-- Question 7
SELECT *
FROM submissions
ORDER BY status_date DESC
LIMIT 10;

-- Question 8 (expect 599 products)
SELECT COUNT(*) AS number_of_products,
       COUNT(DISTINCT active_ingredient) AS number_of_ingredients
FROM products;

-- Question 9
-- The obvious query. NULL rows are silently left out, so this is NOT the full answer:
SELECT COUNT(*)
FROM submissions
WHERE review_priority <> 'STANDARD';

-- How many are blank?
SELECT COUNT(*)
FROM submissions
WHERE review_priority IS NULL;

-- The honest answer: not STANDARD, including the blank ones
SELECT COUNT(*)
FROM submissions
WHERE review_priority <> 'STANDARD'
   OR review_priority IS NULL;
