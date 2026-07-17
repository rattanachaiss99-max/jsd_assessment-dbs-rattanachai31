// Task 2: Shift Activity Report
// Jane Doe has an upcoming performance review and the manager wants to look at her order history
// ahead of the meeting. They only need to see when each order was placed and what it was worth —
// no other details are required for this particular review.
//
// Hint: Write a query to find all orders handled by the staff member "Jane Doe".
// Your query should only return the order_date and total_price fields for these orders.

// Bonus: The dataset is identical in the PostgreSQL database, meaning the same business insight can be retrieved.
// Write the equivalent query for PostgreSQL. See query_task2_bonus.sql

// ---------------------------------------------------------------
// Your thinking process (required)
// ---------------------------------------------------------------
// Before writing your query, explain in your own words how you
// interpreted the task, what data you need, which collection(s)
// are involved, and what MongoDB concepts you plan to use.
// Write in English or Thai. Do not skip this step.
//
// Your thinking: [โจทย์] ผู้จัดการต้องการดูออร์เดอร์ของ JANE DOE เพื่อประเมิน
//      >>> [จากคำใบ้] >>> ข้อมูลที่ต้องการอยู่ใน orders 
//      [สำหรับ mongoDB] 1.หาชื่อจาก orders ฟิลด์ staff แยก first_name และ last_name ต้องใช้ .find(query, projection)
//      [ผลลัพธ์ (query) > ชื่อ] ต้องเป็น "Jane" และ "Doe"
//      [ผลลัพธ์ (projection) > ออร์เดอร์] ต้องแสดงผล (:1) order_date และ total_price ปิด (:0) _id
//      
//

db.orders.find(
  { 
    "staff.first_name": "Jane", 
    "staff.last_name": "Doe" 
  }, 
  { 
    order_date: 1, 
    total_price: 1, 
    _id: 0 
  }
)