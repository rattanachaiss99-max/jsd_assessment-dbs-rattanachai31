-- Task 4 Bonus: Total Revenue Summary
-- At the end of the trading period, the owner wants a single figure that shows how much revenue
-- the truck has generated across all recorded orders. This number will be used in their
-- financial summary report, so the result should be returned as a single value named total_revenue.
--
-- The dataset is identical in PostgreSQL — the same business insight can be retrieved.
--
-- Hint: Write a query that uses an aggregate function on the Orders table
-- to sum the total_price across all orders, returning the result as total_revenue.

-- ---------------------------------------------------------------
-- Your thinking process (required)
-- ---------------------------------------------------------------
-- Before writing your query, explain in your own words how you
-- interpreted the task, what data you need, which table(s) are
-- involved, and what SQL concepts you plan to use.
-- Write in English or Thai. Do not skip this step.
--
-- Your thinking : [โจทย์] เจ้าของร้านต้อง รายได้ทั้งหมดจากออร์เดอร์ที่บันทึกไว้
--     >>> [จากคำใบ้] > สร้างข้อมูลแบบ PostgreSQL Orders ตาม query_task2_bonus.sql
--      [สำหรับ PGSQL] 0.เปลี่ยน mongo เป็นแบบ PGSQL (เริ่มต้นที่ไอดี 41)
--                    1.รวมข้อมูลจากฟิลด์ total_price สำหรับออร์เดอร์ทั้งหมด
--                    2.รวมกันด้วย SUM() ง่ายที่สุด
--      [ผลลัพธ์] ผลรวมของราคาออร์เดอร์ทั้งหมด
--


CREATE OR REPLACE FUNCTION calculate_total_revenue() 
RETURNS DECIMAL(10,2) AS $$
DECLARE 
    total_rev DECIMAL(10,2) := 0;
    current_price DECIMAL(10,2);
BEGIN     
    FOR current_price IN SELECT total_price FROM Orders2 LOOP 
        total_rev := total_rev + current_price;
    END LOOP; 
    RETURN total_rev; 
END;
$$ LANGUAGE plpgsql;

SELECT calculate_total_revenue() AS total_revenue;

-- SELECT SUM(total_price) AS total_revenue
-- FROM Orders;

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