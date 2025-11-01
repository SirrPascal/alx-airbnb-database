# **Entity and Relationship Identification**

![Database ER Diagram](https://github.com/SirrPascal/alx-airbnb-database/blob/main/ERD/Database%20ER%20diagram%20(crow's%20foot).jpeg?raw=true)
## Entities and Attributes**

### **User**
- **Primary Key:** `user_id`
- **Attributes:** `first_name`, `last_name`, `email`, `password_hash`, `phone_number`, `role`, `created_at`
- **Constraints:** `email` is UNIQUE, `role` ENUM (`guest`, `host`, `admin`), non-null constraints on required fields.
- **Notes:** Represents all users in the system, including guests, hosts, and admins.

### **Property**
- **Primary Key:** `property_id`
- **Foreign Key:** `host_id` → `User(user_id)`
- **Attributes:** `name`, `description`, `location`, `price_per_night`, `created_at`, `updated_at`
- **Constraints:** Foreign key constraint on `host_id`, non-null constraints on essential attributes.
- **Notes:** Each property is owned by a user acting as a host.

### **Booking**
- **Primary Key:** `booking_id`
- **Foreign Keys:** `property_id` → `Property(property_id)`, `user_id` → `User(user_id)`
- **Attributes:** `start_date`, `end_date`, `total_price`, `status`, `created_at`
- **Constraints:** `status` ENUM (`pending`, `confirmed`, `canceled`), foreign key constraints on `property_id` and `user_id`.
- **Notes:** Links a guest user to a property booking.

### **Payment**
- **Primary Key:** `payment_id`
- **Foreign Key:** `booking_id` → `Booking(booking_id)`
- **Attributes:** `amount`, `payment_date`, `payment_method`
- **Constraints:** `payment_method` ENUM (`credit_card`, `paypal`, `stripe`), non-null fields for amount and booking reference.
- **Notes:** Each booking has one associated payment.

### **Review**
- **Primary Key:** `review_id`
- **Foreign Keys:** `property_id` → `Property(property_id)`, `user_id` → `User(user_id)`
- **Attributes:** `rating`, `comment`, `created_at`
- **Constraints:** `rating` CHECK (1 ≤ rating ≤ 5), foreign key constraints on property and user.
- **Notes:** Each review is written by a user for a specific property.

### **Message**
- **Primary Key:** `message_id`
- **Foreign Keys:** `sender_id` → `User(user_id)`, `recipient_id` → `User(user_id)`
- **Attributes:** `message_body`, `sent_at`
- **Constraints:** Both sender and recipient must exist in the User table.
- **Notes:** Represents private messages exchanged between users.

---

##  Relationships Between Entities**

### **User – Property**
- **Type:** One-to-Many (1:N)
- **Description:** A user (host) can own multiple properties, but each property belongs to one host.
- **Representation:** `[User] (host_id) 1 → N [Property]`

### **User – Booking**
- **Type:** One-to-Many (1:N)
- **Description:** A user (guest) can make multiple bookings, each booking belongs to one user.
- **Representation:** `[User] (user_id) 1 → N [Booking]`

### **Property – Booking**
- **Type:** One-to-Many (1:N)
- **Description:** A property can have multiple bookings, each booking belongs to one property.
- **Representation:** `[Property] (property_id) 1 → N [Booking]`

### **Booking – Payment**
- **Type:** One-to-One (1:1)
- **Description:** Each booking has one corresponding payment record.
- **Representation:** `[Booking] 1 → 1 [Payment]`

### **User – Review**
- **Type:** One-to-Many (1:N)
- **Description:** A user can write multiple reviews, each review belongs to one user.
- **Representation:** `[User] 1 → N [Review]`

### **Property – Review**
- **Type:** One-to-Many (1:N)
- **Description:** A property can receive multiple reviews, each review belongs to one property.
- **Representation:** `[Property] 1 → N [Review]`

### **User – Message (Self-Referencing)**
- **Type:** One-to-Many (1:N)
- **Description:** A user can send and receive multiple messages to/from other users.
- **Representation:** `[User] (sender_id) 1 → N [Message] ← 1 (recipient_id) [User]`

---

## Summary**
- The database represents a **property rental platform**.  
- The **User** entity is central, acting as both **guest** and **host**.  
- **Property**, **Booking**, **Payment**, **Review**, and **Message** entities are interconnected through well-defined one-to-many and one-to-one relationships.  
- This structure maintains **referential integrity**, supports **scalability**, and reflects a **real-world accommodation system**.