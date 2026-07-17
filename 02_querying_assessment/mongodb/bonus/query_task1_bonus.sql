-- Task 1 Bonus: Budget Meal Deal
-- The owner wants to introduce a budget-friendly meal deal promotion and needs to identify
-- which menu items could be included. To qualify, an item must be priced under $10.00,
-- so they can offer good value without cutting too deep into margins.
--
-- The dataset is identical in PostgreSQL — the same business insight can be retrieved.
--
-- Hint: Write a query to find the name and price of all rows in the MenuItems table
-- where the price is less than 10.

-- ---------------------------------------------------------------
-- Your thinking process (required)
-- ---------------------------------------------------------------
-- Before writing your query, explain in your own words how you
-- interpreted the task, what data you need, which table(s) are
-- involved, and what SQL concepts you plan to use.
-- Write in English or Thai. Do not skip this step.
--
-- Your thinking : [โจทย์] เจ้าของร้านต้องการโปรโมชั่น โดยมีเงื่อนไขว่าต้องมีราคาต่ำกว่า 10$
--     >>> [จากคำใบ้] > สร้างข้อมูลแบบ PostgreSQL
--      [สำหรับ PGSQL] 0.เปลี่ยน mongo เป็นแบบ PGSQL
--                    1.กรองฟิลด์ name และ price ด้วย SELECT
--                    2.จากตาราง menuitems (FROM) ด้วยเงื่อนไขราคาน้อยกว่า $10
--      [ผลลัพธ์] ต้องเป็น Classic Fries , Onion Rings , Soda , Bottled เพราะราคาน้อยกว่า $10
--

SELECT name, price
FROM menuitems
WHERE price < 10.00;

-- INSERT INTO MenuItems (item_id, name, description, price, category) VALUES
-- (1, 'The All-American', 'A classic beef burger with lettuce, tomato, and our special sauce.', 12.50, 'Burger'),
-- (2, 'Bacon Cheeseburger', 'Our classic burger topped with crispy bacon and melted cheese.', 14.00, 'Burger'),
-- (3, 'The Aloha Burger', 'A beef burger with a tropical twist, featuring grilled pineapple.', 13.50, 'Burger'),
-- (4, 'Veggie Burger', 'A delicious plant-based patty with all the fixings.', 11.50, 'Burger'),
-- (5, 'Classic Fries', 'Golden and crispy french fries.', 5.00, 'Side'),
-- (6, 'Onion Rings', 'Battered and fried to perfection.', 6.00, 'Side'),
-- (7, 'Soda', 'Choose from a variety of classic sodas.', 2.50, 'Drink'),
-- (8, 'Bottled Water', 'Pure and simple.', 2.00, 'Drink');