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
--      [สำหรับ PGSQL] 0.เปลี่ยน mongo เป็นแบบ PGSQL เริ่มต้นที่ไอดี 41 (ออร์เดอร์เริ่มต้นที่ _id: ObjectId("634d00000000000000000041") ออร์เดอร์) , พนักงานเริ่มต้นที่ 11
--                    1.การหาออร์เดอร์ทั้งหมด หาข้อมูลวันที่ และ ราคารวม 
--                    2.การหาข้อมูลพนักงานทั้งหมด 
--                    3.1,2 มี staff_id ตรงกันสำหรับเงื่อนไขในการกรอง
--                    4.เงื่อนไขต้องเท่ากับ 1 หรือ Jane Doe
--      [ผลลัพธ์] "order_date" , "order_price" ของ Jane Doe
--

SELECT order_date, total_price
FROM Orders
WHERE staff_id = (
    SELECT staff_id 
    FROM Staff 
    WHERE first_name = 'Jane' AND last_name = 'Doe'
);

-- INSERT INTO Orders (order_id, order_date, total_price, staff_id) VALUES
-- (41, '2025-10-26 12:05:00', 34.00, 11),  
-- (42, '2025-10-26 12:10:00', 19.50, 13),  
-- (43, '2025-10-26 12:15:00', 25.00, 11),  
-- (44, '2025-10-26 12:20:00', 9.50, 13),   
-- (45, '2025-10-26 12:30:00', 13.50, 11),  
-- (46, '2025-10-26 12:35:00', 38.00, 13),  
-- (47, '2025-10-27 12:05:00', 19.50, 11),  
-- (48, '2025-10-27 12:10:00', 80.00, 12),  
-- (49, '2025-10-27 12:15:00', 14.00, 13),  
-- (50, '2025-10-28 12:00:00', 17.50, 11),  
-- (51, '2025-10-28 12:05:00', 25.00, 13),  
-- (52, '2025-10-28 12:10:00', 21.00, 12),  
-- (53, '2025-10-29 12:00:00', 57.00, 11),  
-- (54, '2025-10-29 12:05:00', 14.50, 13),  
-- (55, '2025-10-29 12:10:00', 40.00, 12),  
-- (56, '2025-10-29 12:15:00', 19.00, 11),  
-- (57, '2025-10-30 12:00:00', 12.50, 13),  
-- (58, '2025-10-30 12:05:00', 16.00, 12),  
-- (59, '2025-10-30 12:10:00', 10.00, 11);  

-- INSERT INTO Staff (staff_id, first_name, last_name, role) VALUES
-- (11, 'Jane', 'Doe', 'Cashier'),       
-- (12, 'John', 'Smith', 'Cook'),        
-- (13, 'Emily', 'Jones', 'Cashier'),    
-- (14, 'Chris', 'Williams', 'Cook');    

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