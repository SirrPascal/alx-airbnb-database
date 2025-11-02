# Complex SQL Queries with Joins

##  Objective
Master SQL joins by writing complex queries using different types of joins.


## Overview
This task demonstrates how to use **INNER JOIN**, **LEFT JOIN**, and **FULL OUTER JOIN** in SQL to combine data across multiple related tables such as `users`, `bookings`, `properties`, and `reviews`.



##  Queries

### 1. INNER JOIN — Users with their Bookings
Retrieves all bookings and the respective users who made those bookings.

### 2. LEFT JOIN — Properties with their Reviews
Retrieves all properties and their reviews, including properties that have no reviews.

### 3. FULL OUTER JOIN — All Users and Bookings
Retrieves all users and all bookings, even if not linked together.

# Practice Subqueries

## Tasks

### Non-Correlated Subquery
**Goal:** Retrieve all properties where the average rating is greater than 4.0.

**Explanation:**
- The subquery groups reviews by `property_id` and calculates the average rating.
- The main query returns property details for those with an average rating above 4.0.

### Correlated Subquery

Goal: Retrieve users who have made more than 3 bookings.

**Explanation:**

- The subquery counts how many bookings belong to the current user.

- The outer query returns users whose booking count exceeds 3.