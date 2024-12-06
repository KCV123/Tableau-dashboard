SELECT * FROM customer;

SELECT * FROM date;

SELECT * FROM geography;

SELECT * FROM internetsales;

SELECT * FROM product;

SELECT * FROM productcategory;

SELECT * FROM productsubcategory;


/* Joining product, productsubcategory, and productcategory tables */
CREATE TABLE product_merged AS
SELECT p.ProductKey, p.ProductAlternateKey, p.EnglishProductName, p.Color, p.SafetyStockLevel,
       p.ReorderPoint, p.Size, p.DaysToManufacture, p.ProductLine, p.ModelName,
       p.EnglishDescription, p.StartDate, p.EndDate, p.Status,
       ps.EnglishProductSubcategoryName, pc.EnglishProductCategoryName
FROM product p
JOIN productsubcategory ps ON p.ProductSubcategoryKey = ps.ProductSubcategoryKey
JOIN productcategory pc ON ps.ProductCategoryKey = pc.ProductCategoryKey;

/* Joining customer and geography tables */
CREATE TABLE customer_merged AS
SELECT c.CustomerKey, c.CustomerAlternateKey, c.Title, c.FirstName, c.MiddleName, c.LastName,
       c.NameStyle, c.BirthDate, c.MaritalStatus, c.Suffix, c.Gender, c.EmailAddress,
       c.YearlyIncome, c.TotalChildren, c.NumberChildrenAtHome, c.EnglishEducation, c.SpanishEducation,
       c.FrenchEducation, c.EnglishOccupation, c.SpanishOccupation, c.FrenchOccupation, c.HouseOwnerFlag,
       c.NumberCarsOwned, c.AddressLine1, c.AddressLine2, c.Phone, c.DateFirstPurchase, c.CommuteDistance,
       g.City, g.StateProvinceCode, g.StateProvinceName, g.CountryRegionCode, g.EnglishCountryRegionName,
       g.SpanishCountryRegionName, g.FrenchCountryRegionName, g.PostalCode, g.SalesTerritoryKey, g.IpAddressLocator
FROM customer c
JOIN geography g ON c.GeographyKey = g.GeographyKey;

SELECT * FROM customer_merged;

SELECT * FROM product_merged;
