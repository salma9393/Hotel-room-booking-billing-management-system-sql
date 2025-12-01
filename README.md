# Hotel-room-booking-billing-management-system-sql

In this project, we are creating a database system for hotel operations using SQL.
The main goal is to store and manage all hotel records digitally instead of maintaining them manually.

🔹 What this project handles
Guest Information – who is staying in the hotel
Room Management – room type, price, availability
Room Booking – check-in, check-out, duration of stay
Billing & Payment – total amount, payment mode, payment status

🔹 Why this database is useful
Helps hotel staff easily check which rooms are available or booked
Reduces manual errors in billing
Tracks payment history clearly (Paid / Pending)
Stores customer booking history for future reference

🔹 How the system works (Flow)
Guest comes → details stored
Guest books a room → room status becomes Booked
Bill is calculated based on number of stay days
Payment is collected → stored in the database
After checkout → room becomes Available again

🔹 SQL Concepts we applied
Tables	To store structured hotel data
Primary / Foreign Keys	To connect tables correctly
Joins	To generate hotel reports
Insert / Update / Delete	To modify hotel records
Views / Subqueries / Functions (optional)	To get business insights
Triggers (optional)	To auto-update booking status after payment

the database can show (reports)
Which rooms are available
Which guests are currently staying
Total revenue earned by hotel
Bookings history for each guest
Pending payments report

