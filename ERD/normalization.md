# Airbnb Database Normalization (Up to 3NF)

## **Objective**
Apply normalization principles to ensure the Airbnb database schema adheres to **Third Normal Form (3NF)**, minimizing redundancy and improving data integrity.


## **Step 1: First Normal Form (1NF)**

### **Rule**
1NF requires that:
- Each table has a **primary key**.
- Each column holds **atomic** values.
- There are **no repeating groups**.

### **Review**
All tables (User, Property, Booking, Payment, Review, Message):
- Have unique primary keys (`*_id` columns as UUIDs).
- Store atomic values (e.g., `first_name`, `email`, `price_per_night`).
- Contain no repeating columns or multi-valued fields.

 **Result:** Schema satisfies **1NF**.


## **Step 2: Second Normal Form (2NF)**

### **Rule**
2NF requires that:
- The table is already in 1NF.
- All **non-key attributes** are **fully dependent** on the **entire primary key**, not just part of it.  

### **Review**
- All tables use **single-column primary keys (UUIDs)**, not composite keys.
- Each non-key attribute depends entirely on its primary key.  
  Example:
  - In the `Booking` table, `total_price`, `status`, `start_date`, and `end_date` depend fully on `booking_id`.

 **Result:** Schema satisfies **2NF**.


## **Step 3: Third Normal Form (3NF)**

### **Rule**
3NF requires that:
- The table is in 2NF.
- There are **no transitive dependencies** (non-key attributes should not depend on other non-key attributes).

### **Review and Refinement**
Each table is examined for transitive dependencies:

#### **User Table**
- All attributes (`first_name`, `last_name`, `email`, `password_hash`, etc.) depend directly on `user_id`.  
- No attribute depends on another non-key attribute.

 In 3NF.


#### **Property Table**
- All attributes depend directly on `property_id`.  
- `host_id` is a foreign key referencing `User`, which is valid for relational mapping (not a transitive dependency).

 In 3NF.

#### **Booking Table**
- Attributes such as `start_date`, `end_date`, `total_price`, and `status` depend on `booking_id`.  
- `property_id` and `user_id` are foreign keys , no violation of 3NF.

 In 3NF.


#### **Payment Table**
- All attributes (`amount`, `payment_date`, `payment_method`) depend on `payment_id`.  
- `booking_id` is a valid foreign key.

 In 3NF.


#### **Review Table**
- `rating`, `comment`, and `created_at` depend on `review_id`.  
- `property_id` and `user_id` are foreign keys, not transitive dependencies.

 In 3NF.

#### **Message Table**
- `message_body` and `sent_at` depend on `message_id`.  
- `sender_id` and `recipient_id` are foreign keys, no transitive dependency.

 In 3NF.


## **Normalization Outcome**

- No redundant data is stored across tables.  
- All dependencies flow from **primary keys only**.  
- The database supports **referential integrity** and **efficient joins** without anomalies.

 **Final Result:**  
**The Airbnb Database Schema is fully normalized up to Third Normal Form (3NF).**

