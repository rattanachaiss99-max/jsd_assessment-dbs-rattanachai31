-- Task 3: Staff Performance Review
-- At the end of the month, the owner wants to reward the hardest-working cashiers.
-- To decide fairly, they want to see how many orders each staff member has processed,
-- with the busiest staff member appearing at the top of the list.
--
-- Hint: Write a query to find the total number of orders processed by each staff member.
-- The result should show the staff member's full name (concatenated) and their total order count,
-- ordered by the count in descending order.

-- Bonus: The dataset is identical in the MongoDB database, meaning the same business insight can be retrieved.
-- Write the equivalent query for MongoDB. See query_task3_bonus.mongodb.js

-- ---------------------------------------------------------------
-- Your thinking process (required)
-- ---------------------------------------------------------------
-- Before writing your query, explain in your own words how you
-- interpreted the task, what data you need, which table(s) are
-- involved, and what SQL concepts you plan to use.
-- Write in English or Thai. Do not skip this step.
--
-- Your thinking: [โจทย์] เจ้าของร้านต้องการรู้ว่าใครรับออร์เดอร์เยอะที่สุด เพื่อให้รางวัล
-- >>>  [จากคำใบ้] > ข้อมูลที่ต้องการอยู่ staff (ชื่อ) และ orders (จำนวนออร์เดอร์) สำหรับประเมินรางวัล
--      [สำหรับ PGSQL] 1.ต้องการชื่อ และนามสกุล ต่อกัน (concatenated) ในชื่อ full_name
--                    2.จำนวนของชื่อและนามสกุลในชื่อ total_orders โดยมีเงื่อนไขว่านับออร์เดอร์ ที่รหัสตรงกับรหัสพนักงาน ในตารางพนักงาน 
--                    3.การจัดเรียง total_orders เรียงลำดับจากมากไปน้อยด้วย ORDER BY
--      [ผลลัพธ์] > ต้องได้ชื่อพนักงาน และ จำนวนออร์เดอร์คู่กัน


SELECT 
    first_name || ' ' || last_name AS full_name, 
    (SELECT COUNT(*) FROM Orders WHERE Orders.staff_id = Staff.staff_id) AS total_orders
FROM Staff
ORDER BY total_orders DESC;