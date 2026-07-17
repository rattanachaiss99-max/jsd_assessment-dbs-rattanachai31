-- Task 2: Kitchen Staff Contact List
-- The manager has a last-minute change to the kitchen prep schedule and needs to notify
-- all cooks as soon as possible. They need the full names of every staff member
-- whose role is 'Cook' so they can be contacted directly.
--
-- Hint: Write a query to list the first_name and last_name of all staff members whose role is 'Cook'.

-- Bonus: The dataset is identical in the MongoDB database, meaning the same business insight can be retrieved.
-- Write the equivalent query for MongoDB. See query_task2_bonus.mongodb.js

-- ---------------------------------------------------------------
-- Your thinking process (required)
-- ---------------------------------------------------------------
-- Before writing your query, explain in your own words how you
-- interpreted the task, what data you need, which table(s) are
-- involved, and what SQL concepts you plan to use.
-- Write in English or Thai. Do not skip this step.
--
-- Your thinking: [โจทย์] ผู้จัดการต้องการรายชื่อพนักงานครัว ต้องการ ชื่อ และ นามสกุล
-- >>>  [จากคำใบ้] > ข้อมูลที่ต้องการอยู่ staff ฟิลด์ first_name และ last_name
--      [สำหรับ PGSQL] 1. รายชื่อพนักงานทั้งหมด เฉพาะชื่อ และ นามสกุล
--                    2. เงื่อนไขสำหรับข้อ 1 ที่ role = cook
--      [ผลลัพธ์] > ต้องได้ John และ Smith , Chris Williams


SELECT first_name, last_name
FROM Staff
WHERE role = 'Cook';