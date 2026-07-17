-- Task 3 Bonus: Stock Replenishment Check
-- Before placing the weekly supply order, the manager wants to avoid over-ordering ingredients
-- that are already well-stocked. They need a list of every ingredient with a stock level
-- of 100 or more so those can be deprioritised in this week's order.
--
-- The dataset is identical in PostgreSQL — the same business insight can be retrieved.
--
-- Hint: Write a query to find the name of all rows in the Ingredients table
-- where the stock_level is greater than or equal to 100.

-- ---------------------------------------------------------------
-- Your thinking process (required)
-- ---------------------------------------------------------------
-- Before writing your query, explain in your own words how you
-- interpreted the task, what data you need, which table(s) are
-- involved, and what SQL concepts you plan to use.
-- Write in English or Thai. Do not skip this step.
--
-- Your thinking:[โจทย์] ผู้จัดการต้องการสต็อกตั้งแต่ 100 ขึ้นไป จะได้ไม่ต้องสั่งเพิ่ม
--     >>> [จากคำใบ้] >>> สร้างข้อมูลแบบ PostgreSQ ข้อมูลที่ต้องการอยู่ใน ingredients
--      [สำหรับ PGSQL] 0.เปลี่ยน mongo เป็นแบบ PGSQL 
--                    1.หาชื่อวัตถุดิบจากจาก ตาราง Ingredients
--                    2.สร้างเงื่อนไข ในการกรองข้อมูลเมื่อ stock_level >= 100
--      [ผลลัพธ์ (query) > ชื่อ] ต้องเป็น วัตถุดิบที่มากกว่า 100 หรือ เท่ากับ 100
--

SELECT name 
FROM Ingredients
WHERE stock_level >= 100;

-- [
--   {
--     "name": "Beef Patty"
--   },
--   {
--     "name": "Veggie Patty"
--   },
--   {
--     "name": "Burger Bun"
--   },
--   {
--     "name": "Cheese Slice"
--   },
--   {
--     "name": "Bacon"
--   },
--   {
--     "name": "Potatoes"
--   }
-- ]