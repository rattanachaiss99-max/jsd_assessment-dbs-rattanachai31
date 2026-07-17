-- Task 4: Supplier Dependency Check
-- The manager has just heard that 'Freshest Farm Produce' may be delayed on their next delivery.
-- Before deciding whether to source from an alternative supplier, they need to know exactly
-- which ingredients depend on that supplier, so they can assess the impact on the menu.
--
-- Hint: Write a query to find the names of all ingredients supplied by 'Freshest Farm Produce'.

-- Bonus: The dataset is identical in the MongoDB database, meaning the same business insight can be retrieved.
-- Write the equivalent query for MongoDB. See query_task4_bonus.mongodb.js

-- ---------------------------------------------------------------
-- Your thinking process (required)
-- ---------------------------------------------------------------
-- Before writing your query, explain in your own words how you
-- interpreted the task, what data you need, which table(s) are
-- involved, and what SQL concepts you plan to use.
-- Write in English or Thai. Do not skip this step.
--
-- Your thinking: [โจทย์] ผู้จัดการกังวลว่า 'Freshest Farm Produce' อาจล่าช้า ต้องการรู้ว่ามีวัตถุดิบไหนบ้างที่ต้องสั่งจาก 'Freshest Farm Produce' 
-- >>>  [จากคำใบ้] > ข้อมูลที่ต้องการอยู่ Ingredients และ Suppliers 
--      [สำหรับ PGSQL] 1.หาข้อมูลของ 'Freshest Farm Produce' (supplier_id = 3)
--                    2.ชื่อวัตถุดิบทั้งหมดจาก Ingredients ที่มีเงื่อนไขว่า supplier_id ตรงกับ 'Freshest Farm Produce' (ข้อ 1)
--                    3.การจัดเรียง total_orders เรียงลำดับจากมากไปน้อยด้วย ORDER BY
--      [ผลลัพธ์] > ต้องได้วัตถุดิบทั้งหมดที่มาจาก 'Freshest Farm Produce'
--

SELECT name 
FROM Ingredients
WHERE supplier_id = (
    SELECT supplier_id 
    FROM Suppliers 
    WHERE name = 'Freshest Farm Produce'
);