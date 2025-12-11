-- create database hotel management
CREATE DATABASE hotel_mgmt;
use hotel_mgmt;
-- create table guests
CREATE TABLE guests (
    guest_id INT PRIMARY KEY AUTO_INCREMENT,
    guest_name VARCHAR(100) NOT NULL,
    phone VARCHAR(15),
    address VARCHAR(255)
);
-- create table rooms
CREATE TABLE rooms (
    room_id INT PRIMARY KEY AUTO_INCREMENT,
    room_type VARCHAR(50),
    price_per_day DECIMAL(10,2),
    status VARCHAR(10) DEFAULT 'AVAILABLE'
);
-- create table bookings
CREATE TABLE bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    guest_id INT,
    room_id INT,
    check_in DATE,
    check_out DATE,
    total_days INT,
    FOREIGN KEY (guest_id) REFERENCES guests(guest_id),
    FOREIGN KEY (room_id) REFERENCES rooms(room_id)
);
-- create table payments
 CREATE TABLE payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    booking_id INT,
    amount DECIMAL(10,2),
    payment_date DATE,
    payment_status VARCHAR(20),
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id)
);
-- insert values
INSERT INTO guests (guest_name, phone, address) VALUES
('Ammu', '9991112222', 'Hyderabad'),
('Ravi', '8881115555', 'Vijayawada'),
('Sita', '9900991122', 'Warangal');
INSERT INTO rooms (room_type, price_per_day, status) VALUES
('AC', 2500, 'AVAILABLE'),
('Non-AC', 1500, 'AVAILABLE'),
('Suite', 4000, 'AVAILABLE');
INSERT INTO bookings (guest_id, room_id, check_in, check_out, total_days) VALUES
(1, 1, '2025-02-01', '2025-02-04', 3),
(2, 3, '2025-02-03', '2025-02-05', 2);
INSERT INTO payments (booking_id, amount, payment_date, payment_status) VALUES
(1, 7500, '2025-02-04', 'PAID'),
(2, 8000, '2025-02-05', 'PENDING');
-- Guest booking full details
SELECT g.guest_name, r.room_type, b.check_in, b.check_out, b.total_days
FROM bookings b
JOIN guests g ON b.guest_id = g.guest_id
JOIN rooms r ON b.room_id = r.room_id;
-- Available rooms
SELECT * FROM rooms WHERE status = 'AVAILABLE';
-- Pending payments list
SELECT g.guest_name, p.amount, p.payment_status
FROM payments p
JOIN bookings b ON p.booking_id = b.booking_id
JOIN guests g ON b.guest_id = g.guest_id
WHERE payment_status = 'PENDING';
-- total revenue generated
SELECT SUM(amount) AS total_revenue FROM payments WHERE payment_status = 'PAID';
-- Calculate room price automatically
DELIMITER $$
CREATE TRIGGER trg_room_status
AFTER INSERT ON bookings
FOR EACH ROW
BEGIN
    UPDATE rooms SET status = 'BOOKED' WHERE room_id = NEW.room_id;
END $$
DELIMITER ;


