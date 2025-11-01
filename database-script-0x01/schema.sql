-- ================================================================
-- SCHEMA: Airbnb Database
-- FILE: schema.sql
-- DESCRIPTION: SQL schema definitions for core database entities.
-- AUTHOR: Pascal
-- ================================================================

-- =============================
-- Table: user
-- =============================
CREATE TABLE `User` (
  `user_id PK` UUID,
  `first_name NOT NULL` VARCHAR,
  `last_name NOT NULL` VARCHAR,
  `email UNIQUE NOT NULL` VARCHAR,
  `password_hash NOT NULL` VARCHAR,
  `phone_number` VARCHAR,
  `role NOT NULL` ENUM,
  `created_at DEFAULT CURRENT_TIMESTAMP` TIMESTAMP
);


-- =============================
-- Table: message
-- =============================
CREATE TABLE `Message` (
  `message_id PK` UUID,
  `sender_id FK` UUID,
  `recipient_id FK` UUID,
  `message_body NOT NULL` TEXT,
  `sent_at DEFAULT CURRENT_TIMESTAMP` TIMESTAMP
);


-- =============================
-- Table: booking
-- =============================
CREATE TABLE `Booking` (
  `booking_id PK` UUID,
  `property_id FK` UUID,
  `user_id FK` UUID,
  `start_date NOT NULL` DATE,
  `end_date NOT NULL` DATE,
  `total_price NOT NULL` DECIMAL,
  `status NOT NULL` ENUM,
  `created_at DEFAULT CURRENT_TIMESTAMP` TIMESTAMP
);


-- =============================
-- Table: payment
-- =============================
CREATE TABLE `Payment` (
  `payment_id PK` UUID,
  `booking_id FK` UUID,
  `amount NOT NULL` DECIMAL,
  `payment_date DEFAULT CURRENT_TIMESTAMP` TIMESTAMP,
  `payment_method NOT NULL` ENUM
);


-- =============================
-- Table: property
-- =============================
CREATE TABLE `Property` (
  `property_id PK` UUID,
  `host_id FK` UUID,
  `name NOT NULL` VARCHAR,
  `description NOT NULL` TEXT,
  `location NOT NULL` VARCHAR,
  `pricepernight NOT NULL` DECIMAL,
  `created_at DEFAULT CURRENT_TIMESTAMP` TIMESTAMP,
  `updated_at ON UPDATE CURRENT_TIMESTAMP` TIMESTAMP
);


-- =============================
-- Table: review
-- =============================
CREATE TABLE `Review` (
  `review_id PK` UUID,
  `property_id FK` UUID,
  `user_id FK` UUID,
  `rating NOT NULL` INTEGER,
  `comment NOT NULL` TEXT,
  `created_at DEFAULT CURRENT_TIMESTAMP` TIMESTAMP
);



