-- Task 2 Bonus: Shift Activity Report
-- Jane Doe has an upcoming performance review and the manager wants to look at her order history
-- ahead of the meeting. They only need to see when each order was placed and what it was worth —
-- no other details are required for this particular review.
--
-- The dataset is identical in PostgreSQL — the same business insight can be retrieved.
--
-- Hint: Write a query to find the order_date and total_price from the Orders table
-- for all orders handled by Jane Doe. You will need to join with the Staff table
-- to filter by the staff member's name.

-- ---------------------------------------------------------------
-- Your thinking process (required)
-- ---------------------------------------------------------------
-- Before writing your query, explain in your own words how you
-- interpreted the task, what data you need, which table(s) are
-- involved, and what SQL concepts you plan to use.
-- Write in English or Thai. Do not skip this step.
--
-- Your thinking : [โจทย์] ผู้จัดการต้องการดูประวัติ ออร์เดอร์ของพนักงาน "Jane Doe" เพื่อประเมิน
--     >>> [จากคำใบ้] > สร้างข้อมูลแบบ PostgreSQL ตารางที่เกี่ยวข้อง Orders และ Staff
--      [สำหรับ PGSQL] 0.เปลี่ยน mongo เป็นแบบ PGSQL
--                    1.การหาออร์เดอร์ทั้งหมด หาข้อมูลวันที่ และ ราคารวม 
--                    2.การหาข้อมูลพนักงานทั้งหมด 
--                    3.1,2 มี staff_id ตรงกันสำหรับเงื่อนไขในการกรอง 
--                    4.เงื่อนไขต้องเท่ากับ 1 หรือ jane doe
--      [ผลลัพธ์] "order_date" , "order_price" ของ Jane Doe
--

SELECT order_date, total_price
FROM Orders
WHERE staff_id = (
    SELECT staff_id 
    FROM Staff 
    WHERE first_name = 'Jane' AND last_name = 'Doe'
);

-- output
-- [
--   {
--     "order_date": "2025-10-26 12:05:00",
--     "total_price": "34.00"
--   },
--   {
--     "order_date": "2025-10-26 12:15:00",
--     "total_price": "25.00"
--   },
--   {
--     "order_date": "2025-10-26 12:30:00",
--     "total_price": "13.50"
--   },
--   {
--     "order_date": "2025-10-27 12:05:00",
--     "total_price": "19.50"
--   },
--   {
--     "order_date": "2025-10-28 12:00:00",
--     "total_price": "17.50"
--   },
--   {
--     "order_date": "2025-10-29 12:00:00",
--     "total_price": "57.00"
--   },
--   {
--     "order_date": "2025-10-29 12:15:00",
--     "total_price": "19.00"
--   },
--   {
--     "order_date": "2025-10-30 12:10:00",
--     "total_price": "10.00"
--   }
-- ]