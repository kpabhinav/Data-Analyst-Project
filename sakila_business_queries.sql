-- =====================================================
-- SQL Business Analysis using Sakila Database
-- Author: Abhinav Kp
-- Skills: JOIN, GROUP BY, Aggregation, CTE, Filtering
-- =====================================================


-- 1. All PG-13 films with rental rate <= 2.99

SELECT *
FROM film f
WHERE f.rental_rate <= 2.99
AND f.rating = 'PG-13';


-- 2. Films containing deleted scenes

SELECT
    f.title,
    f.special_features,
    f.release_year
FROM film f
WHERE f.special_features LIKE '%Deleted Scenes%';


-- 3. All active customers

SELECT *
FROM customer
WHERE active = 1;


-- 4. Customers who rented movies on July 26, 2025

SELECT
    r.rental_id,
    r.rental_date,
    r.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS full_name
FROM rental r
JOIN customer c
ON c.customer_id = r.customer_id
WHERE DATE(r.rental_date) = '2025-07-26';


-- 5. Customer district names

SELECT DISTINCT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS full_name,
    a.district
FROM customer c
JOIN address a
ON a.address_id = c.address_id;


-- 6. Number of rentals each day

SELECT
    DATE(rental_date) AS rental_day,
    COUNT(*) AS total_rentals
FROM rental
GROUP BY DATE(rental_date)
ORDER BY rental_day;


-- 7. All Sci-Fi films in catalogue

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


-- 8. Customers and number of rentals

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


-- 9. Movies with very low rentals

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


-- 10. Movies not returned yet

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
