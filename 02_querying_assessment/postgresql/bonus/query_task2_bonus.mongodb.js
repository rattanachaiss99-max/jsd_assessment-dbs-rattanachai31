// Task 2 Bonus: Kitchen Staff Contact List
// The manager has a last-minute change to the kitchen prep schedule and needs to notify
// all cooks as soon as possible. They need the full names of every staff member
// whose role is 'Cook' so they can be contacted directly.
//
// The dataset is identical in MongoDB — the same business insight can be retrieved.
//
// Hint: Write a query on the staff collection to find the first_name and last_name
// of all documents where the role is 'Cook'.

// ---------------------------------------------------------------
// Your thinking process (required)
// ---------------------------------------------------------------
// Before writing your query, explain in your own words how you
// interpreted the task, what data you need, which collection(s)
// are involved, and what MongoDB concepts you plan to use.
// Write in English or Thai. Do not skip this step.
//
// Your thinking: [โจทย์]เป้าหมายเดียวกับ query_task2.sql ต้องการรายชื่อพนักงานตำแหน่ง Cook
// >>>  [จากคำใบ้] > ข้อมูลพนักงานพร้อม first_name และ last_name
//      [สำหรับ mongoDB] 0.สร้าง DB แบบ PGSQL
//                      1.ใช้ .find(query, projection) 
//                      2.กรองข้อมูลพนักงาน ตำแหน่ง (role) = cook
//                      3.กำหนดข้อมูลที่แสดง/ไม่แสดง first_name , last_name (1) และ _id(0)
//      [ผลลัพธ์] > ต้องได้ John Smith
//

db.staff.find(
  { role: "Cook" },
  { first_name: 1, last_name: 1, _id: 0 }
)

// [
//   { "first_name": "John", "last_name": "Smith" },
//   { "first_name": "Chris", "last_name": "Williams" }
// ]

// Database
// db.staff.insertMany([
//   { staff_id: 1, first_name: "Jane", last_name: "Doe", role: "Cashier" },
//   { staff_id: 2, first_name: "John", last_name: "Smith", role: "Cook" },
//   { staff_id: 3, first_name: "Emily", last_name: "Jones", role: "Cashier" },
//   { staff_id: 4, first_name: "Chris", last_name: "Williams", role: "Cook" }
// ]);