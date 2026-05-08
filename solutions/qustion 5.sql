SELECT
    companyName,
    productName,
    description,
    maxPrice,
    CASE  -- used to clasify medicin by price 
        WHEN maxPrice > 1000 THEN 'pricey'
        WHEN maxPrice < 5 THEN 'affordable'
    END AS price_category
FROM Medicine
WHERE maxPrice > 1000
   OR maxPrice < 5
ORDER BY maxPrice DESC;
