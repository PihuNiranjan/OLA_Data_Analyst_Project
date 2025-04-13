show databases
use bookings
show tables
rename table `bookings-20000-rows` to bookings;

select * from bookings;
-- 1. Retrieve all successful bookings:
CREATE VIEW Successful_Booking AS
    SELECT 
        *
    FROM
        bookings
    WHERE
        Booking_Status = 'Success';
        
select * from Successful_Booking;
-- 2. Find the average ride distance for each vehicle type:
CREATE VIEW average_rides_distance AS
    SELECT 
         Vehicle_Type, AVG(Ride_Distance)
    FROM
        bookings
    GROUP BY Vehicle_Type;

select * from average_rides_distance;
-- 3. Get the total number of cancelled rides by customers:
CREATE VIEW canceled_rides_by_customers AS
    SELECT 
        COUNT(*) AS canceled_rides_by_customers
    FROM
        bookings
    WHERE
        Booking_Status = 'Canceled by Customer';
        
select * from canceled_rides_by_customers;
-- 4. List the top 5 customers who booked the highest number of rides:
CREATE VIEW highest_no_of_rides AS
    SELECT 
        COUNT(*) AS no_of_rides, Customer_ID
    FROM
        bookings
    GROUP BY Customer_ID
    ORDER BY no_of_rides DESC
    LIMIT 5;
    
select * from highest_no_of_rides;
-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
CREATE VIEW No_of_rides_cancelled_by_drivers AS
    SELECT 
        COUNT(*) AS cancelled_by_drivers
    FROM
        bookings
    where  Canceled_Rides_by_Driver = 'Personal & Car related issue';

select * from No_of_rides_cancelled_by_drivers;


-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
CREATE VIEW maximum_and_minimum_driver AS
    SELECT 
        MAX(Driver_Ratings) AS maximum_rating,
        MIN(Driver_Ratings) AS minimum_rating
    FROM
        bookings
   where Vehicle_Type = 'Prime Sedan';

select * from maximum_and_minimum_driver;

-- 7. Retrieve all rides where payment was made using UPI:

CREATE VIEW UPI_payment_rides AS
    SELECT 
        *
    FROM
        bookings
    WHERE
        Payment_Method = 'UPI';

SELECT 
    *
FROM
    UPI_payment_rides;
-- 8. Find the average customer rating per vehicle type:
CREATE VIEW avg_cust_rating_vehicle AS
    SELECT 
        Vehicle_Type, AVG(Customer_Rating) AS customer_rating
    FROM
        bookings
    GROUP BY Vehicle_Type;
SELECT 
    *
FROM
    avg_cust_rating_vehicle;
-- 9. Calculate the total booking value of rides completed successfully:
SELECT 
    SUM(Booking_Value) AS tot_book_val
FROM
    bookings
WHERE
    Incomplete_Rides = 'No';

-- 10. List all incomplete rides along with the reason:
CREATE VIEW incomplete_rides AS
    SELECT 
        Booking_ID, Incomplete_Rides_Reason
    FROM
        bookings
    WHERE
        Incomplete_Rides = 'Yes';
SELECT 
    *
FROM
    incomplete_rides;