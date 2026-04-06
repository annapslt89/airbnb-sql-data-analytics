--Ερώτηση 1--
SELECT COUNT(*) as CountListings
FROM listings;

--Ερώτηση 2--
SELECT COUNT(*) as CountReviews
FROM reviews;

--Ερώτηση 3--
SELECT COUNT(DISTINCT host_id) as CountUniqueHosts
FROM listings;

--Ερώτηση 4--
SELECT DISTINCT neighbourhood
FROM listings;

--Ερώτηση 5--
SELECT COUNT(*) as Bookings
FROM bookings
WHERE available = 0;

--Ερώτηση 6--
SELECT neighbourhood_cleansed,
COUNT(*) * 100.0 / (SELECT COUNT(*) FROM listings) as Percentage
FROM listings
GROUP BY neighbourhood_cleansed

--Ερώτηση 7--
SELECT*
FROM listings
WHERE neighbourhood_cleansed LIKE 'Π%';

--Ερώτηση 8--
SELECT *
FROM listings 
WHERE TRY_CAST(REPLACE(price, '$', '') AS FLOAT) BETWEEN 0 AND 100 

--Ερώτηση 9--
SELECT host_is_superhost, COUNT(*) as Total_listings
FROM listings
WHERE host_is_superhost IS NOT NULL
GROUP BY host_is_superhost;

--Ερώτηση 10--
SELECT host_id, host_name, COUNT(*) as NumberOfListings
FROM listings
GROUP BY host_id, host_name
ORDER BY NumberOfListings DESC;

--Ερώτηση 11-
SELECT listing_id, name
FROM listings
WHERE listing_id NOT IN (
    SELECT DISTINCT listing_id 
    FROM reviews
);

--Ερώτηση 12
SELECT COUNT(DISTINCT host_id) AS total_hosts_with_pic
FROM listings
WHERE host_has_profile_pic = 1

--Ερώτηση 13-
 SELECT neighbourhood, AVG(TRY_CAST(REPLACE(price, '$', '') AS FLOAT)) as Average_Price
 FROM listings
 GROUP BY neighbourhood
 ORDER BY Average_Price DESC;

--Ερώτηση 14-
SELECT TOP 1 property_type, AVG(TRY_CAST(REPLACE(price, '$', '') AS FLOAT)) as Average_Price
FROM listings
GROUP BY  property_type
ORDER BY Average_Price DESC

--Ερώτηση 15-
 SELECT neighbourhood, AVG(TRY_CAST(REPLACE(price, '$', '') AS FLOAT)) as Average_Price
 FROM listings
 GROUP BY neighbourhood
 HAVING AVG(TRY_CAST(REPLACE(price, '$', '') AS FLOAT)) > 200
 ORDER BY Average_Price DESC
 
 --Ερώτηση 16-
 SELECT listings.property_type , COUNT(*) as Total_Bookings
 FROM listings
 INNER JOIN bookings ON Listings.listing_id = bookings.listing_id
 WHERE bookings.available = 0
 GROUP BY listings.property_type
 ORDER BY Total_Bookings DESC;

  --Ερώτηση 17-
  SELECT listings.room_type, COUNT(*) as Total_Reviews
  FROM listings
  INNER JOIN reviews ON listings.listing_id= reviews.listing_id
  GROUP BY listings.room_type
  ORDER BY Total_Reviews DESC;

  --Ερώτηση 18-
  SELECT listings.name, listings.host_id, listings.price, COUNT(reviews.listing_id) as Total_Reviews, COUNT(bookings.listing_id) as Total_Bookings
  FROM listings
  LEFT JOIN reviews ON listings.listing_id= reviews.listing_id
  LEFT JOIN bookings ON Listings.listing_id = bookings.listing_id
  WHERE bookings.available = 0
  GROUP BY  listings.name, listings.host_id, listings.price
  ORDER BY Total_Reviews DESC


 