
-- =============================
-- Table: User
-- =============================
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at)
VALUES
  ('uuid-001', 'John', 'Doe', 'john@example.com', 'hashed_pass_1', '0712345678', 'host', CURRENT_TIMESTAMP),
  ('uuid-002', 'Jane', 'Smith', 'jane@example.com', 'hashed_pass_2', '0723456789', 'guest', CURRENT_TIMESTAMP),
  ('uuid-003', 'Alice', 'Brown', 'alice@example.com', 'hashed_pass_3', NULL, 'admin', CURRENT_TIMESTAMP);

-- =============================
-- Table: Property
-- =============================
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight, created_at, updated_at)
VALUES
  ('uuid-p001', 'uuid-001', 'Seaside Villa', 'A luxurious beachfront villa with pool.', 'Mombasa', 250.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  ('uuid-p002', 'uuid-001', 'Mountain Cabin', 'Cozy cabin with scenic mountain views.', 'Nakuru', 120.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  ('uuid-p003', 'uuid-003', 'City Apartment', 'Modern apartment in downtown Nairobi.', 'Nairobi', 80.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- =============================
-- Table: Booking
-- =============================
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at)
VALUES
  ('uuid-b001', 'uuid-p001', 'uuid-002', '2025-11-10', '2025-11-15', 1250.00, 'confirmed', CURRENT_TIMESTAMP),
  ('uuid-b002', 'uuid-p003', 'uuid-002', '2025-12-05', '2025-12-08', 240.00, 'pending', CURRENT_TIMESTAMP),
  ('uuid-b003', 'uuid-p002', 'uuid-001', '2025-12-20', '2025-12-25', 600.00, 'canceled', CURRENT_TIMESTAMP);

-- =============================
-- Table: Payment
-- =============================
INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method)
VALUES
  ('uuid-pay001', 'uuid-b001', 1250.00, CURRENT_TIMESTAMP, 'credit_card'),
  ('uuid-pay002', 'uuid-b002', 240.00, CURRENT_TIMESTAMP, 'paypal'),
  ('uuid-pay003', 'uuid-b003', 600.00, CURRENT_TIMESTAMP, 'stripe');

-- =============================
-- Table: Review
-- =============================
INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at)
VALUES
  ('uuid-r001', 'uuid-p001', 'uuid-002', 5, 'Fantastic stay! Highly recommended.', CURRENT_TIMESTAMP),
  ('uuid-r002', 'uuid-p003', 'uuid-002', 4, 'Very clean and comfortable.', CURRENT_TIMESTAMP),
  ('uuid-r003', 'uuid-p002', 'uuid-001', 3, 'Nice view but a bit far from town.', CURRENT_TIMESTAMP);

-- =============================
-- Table: Message
-- =============================
INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at)
VALUES
  ('uuid-m001', 'uuid-002', 'uuid-001', 'Hi, is the villa available for next week?', CURRENT_TIMESTAMP),
  ('uuid-m002', 'uuid-001', 'uuid-002', 'Yes, it’s available from 10th to 15th November.', CURRENT_TIMESTAMP),
  ('uuid-m003', 'uuid-003', 'uuid-001', 'Reminder: update property details.', CURRENT_TIMESTAMP);
