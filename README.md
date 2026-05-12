# Call Center Dashboard

## Tools Used
- Excel
- Pivot Tables
- Charts
- Data Cleaning

## Project Overview
This dashboard analyzes:
- Call volume
- Agent performance
- Customer satisfaction
- Resolution trends

## Key Insights
- Peak call hours identified
- Top performing agents tracked
- Customer satisfaction trends analyzed

## Files
- Excel dashboard (.xlsx)
- Dashboard screenshots


# Sales Dashboard - Power BI

## Tools Used
- Power BI
- Power Query
- DAX
- Data Modeling

## Dashboard Features
- Revenue KPIs
- Regional analysis
- Sales trends
- Product performance

## Skills Demonstrated
- Data cleaning
- DAX calculations
- Interactive visualization
- Business insights

# SQL Business Analysis using Sakila Database

## Project Overview
This project contains business-oriented SQL queries performed on the Sakila sample database using MySQL. The objective was to analyze customer activity, movie rentals, inventory trends, and operational insights for a DVD rental business.

The project demonstrates practical SQL skills used in real-world data analysis and reporting tasks.

---

## Tools Used
- MySQL
- SQL
- Sakila Sample Database

---

## SQL Skills Demonstrated
- SELECT statements
- Filtering with WHERE
- Aggregate functions
- GROUP BY and HAVING
- INNER JOIN
- Common Table Expressions (CTE)
- Sorting with ORDER BY
- NULL handling
- Date filtering
- Business analysis queries

---

## Business Questions Solved

### 1. All PG-13 films with rental rate less than or equal to 2.99

```sql
SELECT *
FROM film f
WHERE f.rental_rate <= 2.99
AND f.rating = 'PG-13';
```

---

### 2. Films containing deleted scenes

```sql
SELECT
    f.title,
    f.special_features,
    f.release_year
FROM film f
WHERE f.special_features LIKE '%Deleted Scenes%';
```

---

### 3. All active customers

```sql
SELECT *
FROM customer
WHERE active = 1;
```

---

### 4. Customers who rented movies on July 26, 2025

```sql
SELECT
    r.rental_id,
    r.rental_date,
    r.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS full_name
FROM rental r
JOIN customer c
ON c.customer_id = r.customer_id
WHERE DATE(r.rental_date) = '2025-07-26';
```

---

### 5. Customer district analysis

```sql
SELECT DISTINCT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS full_name,
    a.district
FROM customer c
JOIN address a
ON a.address_id = c.address_id;
```

---

### 6. Number of rentals each day

```sql
SELECT
    DATE(rental_date) AS rental_day,
    COUNT(*) AS total_rentals
FROM rental
GROUP BY DATE(rental_date)
ORDER BY rental_day;
```

---

### 7. All Sci-Fi films in catalogue

```sql
SELECT
    f.film_id,
    f.title,
    f.release_year,
    c.name AS category
FROM film_category fc
JOIN category c
ON c.category_id = fc.category_id
JOIN film f
ON f.film_id = fc.film_id
WHERE c.name = 'Sci-Fi';
```

---

### 8. Customers and number of rentals

```sql
SELECT
    r.customer_id,
    c.first_name,
    c.email,
    COUNT(*) AS rental_count
FROM rental r
JOIN customer c
ON c.customer_id = r.customer_id
GROUP BY r.customer_id, c.first_name, c.email
ORDER BY rental_count DESC;
```

---

### 9. Movies with very low rentals

```sql
WITH low_rentals AS (
    SELECT
        inventory_id,
        COUNT(*) AS rental_count
    FROM rental
    GROUP BY inventory_id
    HAVING COUNT(*) <= 1
)

SELECT
    lr.inventory_id,
    i.film_id,
    f.title
FROM low_rentals lr
JOIN inventory i
ON i.inventory_id = lr.inventory_id
JOIN film f
ON f.film_id = i.film_id;
```

---

### 10. Movies not returned yet

```sql
SELECT
    r.rental_date,
    r.customer_id,
    i.film_id,
    f.title
FROM rental r
JOIN inventory i
ON i.inventory_id = r.inventory_id
JOIN film f
ON f.film_id = i.film_id
WHERE r.return_date IS NULL
ORDER BY f.title;
```

---

## Key Learnings
Through this project, I gained hands-on experience in:
- Writing analytical SQL queries
- Working with relational databases
- Combining multiple tables using joins
- Performing customer and inventory analysis
- Extracting business insights from transactional data

---

## Files Included
- SQL query file
- Query result screenshots
- README documentation

---

## Author
Abhinav Kp
