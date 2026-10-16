# Lesson 1: interview questions
Answer each one out loud before reading the hint.

**1. What is the order a SQL query is written in, and what does each part do?**
SELECT picks columns, FROM picks the table, WHERE filters rows, ORDER BY sorts, LIMIT cuts the number of rows.

**2. What is the difference between COUNT(*), COUNT(column) and COUNT(DISTINCT column)?**
COUNT(*) counts rows. COUNT(column) counts rows where that column is not NULL. COUNT(DISTINCT column) counts different non-NULL values.

**3. A column has some blank (NULL) values. You filter WHERE col <> 'X'. Do the NULL rows come back? Why?**
No. Comparing NULL to anything gives "unknown", not true, so those rows are dropped. Add OR col IS NULL if you want them.

**4. In pandas, `df['col'] != 'X'` includes missing values, but SQL's `<>` does not. What would you do?**
Say which behaviour you want and write it explicitly: `df['col'].notna() & (df['col'] != 'X')` matches SQL.

**5. Without ORDER BY, which rows does LIMIT 10 return?**
Any 10 rows. SQL does not promise an order unless you ask for one.

**6. How do you filter rows in pandas, and what is the SQL equivalent?**
Boolean indexing: `df[df['col'] == 'X']` is the same as `WHERE col = 'X'`.

**7. LIKE '%TABLET%': what does the % mean, and is it case sensitive in PostgreSQL?**
% means any characters. LIKE is case sensitive in PostgreSQL; ILIKE ignores case.
