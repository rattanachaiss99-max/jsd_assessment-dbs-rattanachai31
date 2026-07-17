-- Task 1: Sides Menu Board
-- The owner wants to update the printed menu board that displays only the side dishes.
-- They need a list of every item in the 'Side' category along with its current price,
-- so the designer can produce an accurate board without having to check each item manually.
--
-- Hint: Write a query to find the name and price of all menu items that are in the 'Side' category.

-- Bonus: The dataset is identical in the MongoDB database, meaning the same business insight can be retrieved.
-- Write the equivalent query for MongoDB. See query_task1_bonus.mongodb.js

-- ---------------------------------------------------------------
-- Your thinking process (required)
-- ---------------------------------------------------------------
-- Before writing your query, explain in your own words how you
-- interpreted the task, what data you need, which table(s) are
-- involved, and what SQL concepts you plan to use.
-- Write in English or Thai. Do not skip this step.
--
-- Your thinking: [โจทย์] เจ้าของร้านต้องการทำป้ายเมนู ทุกเมนูเครื่องเคียง ต้องการรู้ ชื่อ และราคา
-- >>>  [จากคำใบ้] > ข้อมูลที่ต้องการอยู่ menu_items ฟิลด์ name และ price
--      [สำหรับ PGSQL] 1.เมนูทั้งหมดใน menuitems เลือกเฉพาะชื่อ และ ราคา
--                    2.กรองข้อมูลในหมวด 'Side'
--      [ผลลัพธ์] > ต้องได้ Classice Fries , Onion Rings
--      
--

SELECT name, price
FROM menuitems
WHERE category = 'Side';