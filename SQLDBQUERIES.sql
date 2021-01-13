--List down all the details of tour leader whose licence expired in 4 months time or already expired
SELECT * 
FROM Staff s INNER JOIN TourLeader t
ON s.StaffID=t.StaffID
WHERE DATEDIFF(MONTH,GETDATE(),t.LicenceExpiryDate) <4

--List down the Airline that has flight more than once in 2019.Display the number of flights in descending order.
SELECT f.Airline, COUNT(f.Airline) AS 'Number of Flights' 
FROM Flight f INNER JOIN Flies_on o
ON f.FlightNo = o.FlightNo 
WHERE DATENAME(YEAR,o.DepartureDate) = 2019
GROUP BY f.Airline
HAVING COUNT(f.Airline)>1
ORDER BY COUNT(f.Airline) DESC

--List down the Bookings booked in November and december that is paid through credit card 
SELECT *
FROM Booking
WHERE DATEPART(MONTH,BookingDate)= 12 AND BookingNo IN
(
	SELECT BookingNo 
	FROM Payment 
	WHERE PmtMethod = 'C' 
)