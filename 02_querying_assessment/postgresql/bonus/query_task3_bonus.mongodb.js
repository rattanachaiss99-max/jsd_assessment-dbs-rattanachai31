// Task 3 Bonus: Staff Performance Review
// At the end of the month, the owner wants to reward the hardest-working cashiers.
// To decide fairly, they want to see how many orders each staff member has processed,
// with the busiest staff member appearing at the top of the list.
//
// The dataset is identical in MongoDB — the same business insight can be retrieved.
//
// Hint: Write an aggregation query on the orders collection to count the number of orders
// per staff member. Each order embeds the staff member's first and last name directly.
// The result should show each staff member's full name and their total order count,
// ordered by the count in descending order.

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
//                      1.ใช้ .aggregate ตามแบบ mongo (รวมการกรองข้อมูลแทน find)
//                      2.กรองข้อมูลพนักงาน ตำแหน่ง (role) = cook
//
//      [ผลลัพธ์] > 
//

db.orders.aggregate([
  {
    $group: {
      _id: "$staff.staff_id",
      first_name: { $first: "$staff.first_name" },
      last_name: { $first: "$staff.last_name" },
      total_orders: { $sum: 1 }
    }
  },
  {
    $project: {
      _id: 0,
      full_name: { $concat: ["$first_name", " ", "$last_name"] },
      total_orders: 1
    }
  },
  {
    $sort: { 
      total_orders: -1 
    }
  }
])

// Output
// [
//   { "full_name": "Jane Doe", "total_orders": 8 },
//   { "full_name": "Emily Jones", "total_orders": 7 },
//   { "full_name": "John Smith", "total_orders": 4 }
// ]



// Staff
// db.staff.insertMany([
//   { staff_id: 1, first_name: "Jane", last_name: "Doe", role: "Cashier" },
//   { staff_id: 2, first_name: "John", last_name: "Smith", role: "Cook" },
//   { staff_id: 3, first_name: "Emily", last_name: "Jones", role: "Cashier" },
//   { staff_id: 4, first_name: "Chris", last_name: "Williams", role: "Cook" }
// ]);

// Orders
// db.orders.insertMany([
//   { order_id: 1, order_date: ISODate("2025-10-26T12:05:00Z"), total_price: Decimal128("34.00"), staff: { staff_id: 1, first_name: "Jane", last_name: "Doe" } },
//   { order_id: 2, order_date: ISODate("2025-10-26T12:10:00Z"), total_price: Decimal128("19.50"), staff: { staff_id: 3, first_name: "Emily", last_name: "Jones" } },
//   { order_id: 3, order_date: ISODate("2025-10-26T12:15:00Z"), total_price: Decimal128("25.00"), staff: { staff_id: 1, first_name: "Jane", last_name: "Doe" } },
//   { order_id: 4, order_date: ISODate("2025-10-26T12:20:00Z"), total_price: Decimal128("9.50"), staff: { staff_id: 3, first_name: "Emily", last_name: "Jones" } },
//   { order_id: 5, order_date: ISODate("2025-10-26T12:30:00Z"), total_price: Decimal128("13.50"), staff: { staff_id: 1, first_name: "Jane", last_name: "Doe" } },
//   { order_id: 6, order_date: ISODate("2025-10-26T12:35:00Z"), total_price: Decimal128("38.00"), staff: { staff_id: 3, first_name: "Emily", last_name: "Jones" } },
//   { order_id: 7, order_date: ISODate("2025-10-27T12:05:00Z"), total_price: Decimal128("19.50"), staff: { staff_id: 1, first_name: "Jane", last_name: "Doe" } },
//   { order_id: 8, order_date: ISODate("2025-10-27T12:10:00Z"), total_price: Decimal128("80.00"), staff: { staff_id: 2, first_name: "John", last_name: "Smith" } },
//   { order_id: 9, order_date: ISODate("2025-10-27T12:15:00Z"), total_price: Decimal128("14.00"), staff: { staff_id: 3, first_name: "Emily", last_name: "Jones" } },
//   { order_id: 10, order_date: ISODate("2025-10-28T12:00:00Z"), total_price: Decimal128("17.50"), staff: { staff_id: 1, first_name: "Jane", last_name: "Doe" } },
//   { order_id: 11, order_date: ISODate("2025-10-28T12:05:00Z"), total_price: Decimal128("25.00"), staff: { staff_id: 3, first_name: "Emily", last_name: "Jones" } },
//   { order_id: 12, order_date: ISODate("2025-10-28T12:10:00Z"), total_price: Decimal128("21.00"), staff: { staff_id: 2, first_name: "John", last_name: "Smith" } },
//   { order_id: 13, order_date: ISODate("2025-10-29T12:00:00Z"), total_price: Decimal128("57.00"), staff: { staff_id: 1, first_name: "Jane", last_name: "Doe" } },
//   { order_id: 14, order_date: ISODate("2025-10-29T12:05:00Z"), total_price: Decimal128("14.50"), staff: { staff_id: 3, first_name: "Emily", last_name: "Jones" } },
//   { order_id: 15, order_date: ISODate("2025-10-29T12:10:00Z"), total_price: Decimal128("40.00"), staff: { staff_id: 2, first_name: "John", last_name: "Smith" } },
//   { order_id: 16, order_date: ISODate("2025-10-29T12:15:00Z"), total_price: Decimal128("19.00"), staff: { staff_id: 1, first_name: "Jane", last_name: "Doe" } },
//   { order_id: 17, order_date: ISODate("2025-10-30T12:00:00Z"), total_price: Decimal128("12.50"), staff: { staff_id: 3, first_name: "Emily", last_name: "Jones" } },
//   { order_id: 18, order_date: ISODate("2025-10-30T12:05:00Z"), total_price: Decimal128("16.00"), staff: { staff_id: 2, first_name: "John", last_name: "Smith" } },
//   { order_id: 19, order_date: ISODate("2025-10-30T12:10:00Z"), total_price: Decimal128("10.00"), staff: { staff_id: 1, first_name: "Jane", last_name: "Doe" } }
// ]);