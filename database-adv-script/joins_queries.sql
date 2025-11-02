-- Complex SQL Queries with Joins

-- 1. Write a query using an INNER JOIN to retrieve all bookings and the respective users who made those bookings.
SELECT 
    users.user_id,
    users.name AS user_name,
    bookings.booking_id,
    bookings.property_id,
    bookings.booking_date
FROM users
INNER JOIN bookings 
    ON users.user_id = bookings.user_id;


-- 2. Write a query using aLEFT JOIN to retrieve all properties and their reviews, including properties that have no reviews.
SELECT 
    properties.property_id,
    properties.name AS property_name,
    reviews.review_id,
    reviews.rating,
    reviews.comment
FROM properties
LEFT JOIN reviews 
    ON properties.property_id = reviews.property_id;


-- 3. Write a query using a FULL OUTER JOIN to retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user.
SELECT 
    users.user_id,
    users.name AS user_name,
    bookings.booking_id,
    bookings.property_id,
    bookings.booking_date
FROM users
FULL OUTER JOIN bookings 
    ON users.user_id = bookings.user_id;
