/*
LESSON 1: Reading data with SELECT

Tables you can use:
  applications (appl_no, appl_type, sponsor_name)
  products     (appl_no, product_no, drug_name, active_ingredient, form, strength)
  submissions  (appl_no, submission_type, submission_no, submission_status, status_date, review_priority)

How to use this file:
  1. Read the question.
  2. Write your own query under it. It is fine to get it wrong the first time.
  3. Select your query and run it. Look at the result.
  4. Only then check 01_solutions.sql.

A query is built from these pieces, in this order:
  SELECT  which columns
  FROM    which table
  WHERE   which rows
  ORDER BY  in what order
  LIMIT   how many rows
*/

-- Question 1
-- Show the first 10 rows of the applications table.
SELECT *
FROM applications
LIMIT 10;


-- Question 2
-- List all applications whose type is 'NDA'.
-- (NDA = brand-name new drug application.)
SELECT *
FROM applications
WHERE appl_type = 'NDA';


-- Question 3
-- How many applications belong to the sponsor 'TEVA'?
-- Hint: COUNT(*) counts rows.
SELECT COUNT(*)
FROM applications
WHERE sponsor_name = 'TEVA';


-- Question 4
-- List each sponsor name once (no repeats). Then count how many different sponsors there are.
-- Hint: DISTINCT, and COUNT(DISTINCT ...).
SELECT DISTINCT sponsor_name
FROM applications;


SELECT COUNT(DISTINCT sponsor_name) AS count_of_sponsors
FROM applications;

-- Question 5
-- Show drug_name and form of products whose form contains the word TABLET.
-- Sort by drug_name A to Z and show 10 rows.
-- Hint: LIKE '%TABLET%' means "contains TABLET".
SELECT drug_name, form
FROM products
WHERE form LIKE '%TABLET%'
ORDER BY drug_name
LIMIT 10;

-- Question 6
-- How many submissions had review_priority equal to 'PRIORITY'?
SELECT COUNT(*)
FROM submissions
WHERE review_priority = 'PRIORITY';


-- Question 7
-- Show the 10 most recent submissions (all columns), newest first.
-- Hint: ORDER BY status_date DESC.
SELECT *
FROM submissions
ORDER BY status_date DESC
LIMIT 10;


-- Question 8
-- How many products are there in total, and how many different active ingredients?
-- Do both in ONE query with two columns.
SELECT COUNT(*) AS number_of_products,
       COUNT(DISTINCT active_ingredient) AS number_of_ingredients
FROM products;


-- Question 9 (trap)
-- How many submissions do NOT have review_priority 'STANDARD'?
-- Write the obvious query first (review_priority <> 'STANDARD').
-- Then check: how many submissions have a blank (NULL) review_priority?
-- Are they in your answer? Why or why not?
-- Hint: you cannot test for NULL with = or <>. You need IS NULL / IS NOT NULL.

/*
Question 9 is a trap.  review_priority <> 'STANDARD'  returns 57 rows, 
because blank values are silently dropped.  1,619 submissions have a 
blank priority, so the honest answer is 1,676.  
In pandas,  !=  counts the blanks, 
so the obvious code gives 1,676 where the SQL gives 57. 
This difference between the two tools is a classic interview topic.
*/

SELECT COUNT(*)
FROM submissions
WHERE review_priority <> 'STANDARD';

SELECT COUNT(*)
FROM submissions
WHERE review_priority IS NULL;

SELECT COUNT(*)
FROM submissions
WHERE review_priority <> 'STANDARD' OR review_priority IS NULL;
