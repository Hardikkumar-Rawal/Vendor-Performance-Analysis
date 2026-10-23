-- Checking tables present in the database

select count (*) from purchases;
select count (*) from begin_inventory;
select count (*) from end_inventory;
select count (*) from purchase_prices;
select count (*) from sales;
select count (*) from vendor_invoice;


select top 5 * from purchases;
select top 5 * from begin_inventory;
select top 5 * from end_inventory;
select top 5 * from purchase_prices;
select top 5 * from sales;
select top 5 * from vendor_invoice;


select * from purchases;
select * from begin_inventory;
select * from end_inventory;
select * from purchase_prices;
select * from sales;
select * from vendor_invoice;



select * from purchases 
where VendorNumber = 4466;

select * from purchase_prices 
where VendorNumber = 4466;

select * from vendor_invoice 
where VendorNumber = 4466;

select * from sales 
where VendorNo = 4466;



--• The purchases table contains actual purchase data, including the date of purchase, products (brands) purchased by vendors, the amount paid (in dollars), and the quantity purchased.
--• The purchase price column is derived from the purchase_prices table, which provides product-wise actual and purchase prices. The combination of vendor and brand is unique in this table.
--• The vendor_invoice table aggregates data from the purchases table, summarizing quantity and dollar amounts, along with an additional column for freight. This table maintains uniqueness based on vendor and PO number.
--• The sales table captures actual sales transactions, detailing the brands purchased by vendors, the quantity sold, the selling price, and the revenue earned.


select brand,PurchasePrice,sum(quantity)as QS,sum(dollars)as DS from purchases
group by Brand,PurchasePrice
order by brand,PurchasePrice;


--1 Freight Summary
select vendornumber,sum(Freight)as FreightCost from vendor_invoice
group by vendornumber
order by vendornumber;



--2 Purchase Summary
select p.vendornumber,
       p.vendorname,
       p.brand,
       p.purchaseprice,
       sum(p.quantity)as TotalPurchaseQuantity,
       sum(p.dollars)as TotalPurchaseDollar,
       pp.volume,
       pp.price as SellingPrice from purchases p
       join purchase_prices pp
       on p.brand = pp.Brand
       where p.PurchasePrice > 0
       group by p.vendornumber,p.vendorname,p.brand,p.purchaseprice,pp.volume,pp.price
order by TotalPurchaseDollar;
       

--3 Sales Summary
select vendorNo,brand,sum(salesdollars)as TotalSalesDollars,sum(salesprice)as TotalSalesPrice,
       sum(salesquantity)as TotalSalesQuantity,sum(excisetax)as TotalExciseTax from sales
       group by VendorNo,Brand
       order by TotalSalesDollars;
      
      
      
-- 1. Create table for Freight Summary
SELECT
    vendornumber,
    SUM(Freight) AS FreightCost
INTO Freight____Summary
FROM vendor_invoice
GROUP BY vendornumber;


-- 2. Create table for Purchase Summary
SELECT
    p.vendornumber,
    p.vendorname,
    p.brand,
    p.purchaseprice,
    SUM(p.quantity) AS TotalPurchaseQuantity,
    SUM(p.dollars) AS TotalPurchaseDollar,
    pp.volume,
    pp.price AS SellingPrice
INTO Purchase____Summary
FROM purchases p
JOIN purchase_prices pp
    ON p.brand = pp.Brand
WHERE p.PurchasePrice > 0
GROUP BY
    p.vendornumber,
    p.vendorname,
    p.brand,
    p.purchaseprice,
    pp.volume,
    pp.price;


-- 3. Create table for Sales Summary
SELECT
    vendorNo,
    brand,
    SUM(salesdollars) AS TotalSalesDollars,
    SUM(salesprice) AS TotalSalesPrice,
    SUM(salesquantity) AS TotalSalesQuantity,
    SUM(excisetax) AS TotalExciseTax
INTO Sales____Summary
FROM sales
GROUP BY
    VendorNo,
    Brand;


-- Create the combined Vendor Sales Summary table

SELECT
    COALESCE(s.vendorNo, p.vendornumber, f.vendornumber) AS VendorNo,
    COALESCE(s.brand, p.brand) AS Brand,

    -- Freight information
    f.FreightCost,

    -- Purchase information
    p.vendorname,
    p.purchaseprice,
    p.TotalPurchaseQuantity,
    p.TotalPurchaseDollar,
    p.volume,
    p.SellingPrice,

    -- Sales information
    s.TotalSalesDollars,
    s.TotalSalesPrice,
    s.TotalSalesQuantity,
    s.TotalExciseTax

INTO Vendor____Sales____Summary

FROM PurchaseSummary p

 left JOIN SalesSummary s
    ON s.vendorNo = p.vendornumber
    AND s.brand = p.brand

 left JOIN FreightSummary f
    ON COALESCE(s.vendorNo, p.vendornumber) = f.vendornumber;

--This query generates a vendor-wise sales and purchase summary, which is valuable for:
--Performance Optimization:
--• The query involves heavy joins and aggregations on large datasets like sales and purchases.
--• Storing the pre-aggregated results avoids repeated expensive computations.
--• Helps in analyzing sales, purchases, and pricing for different vendors and brands.
--• Future Benefits of Storing this data for faster Dashboarding & Reporting.
--• Instead of running expensive queries each time, dashboards can fetch data quickly from vendor_sales_summary.











      


