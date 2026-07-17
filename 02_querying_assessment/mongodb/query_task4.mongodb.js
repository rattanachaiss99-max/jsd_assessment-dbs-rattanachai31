// Task 4: Total Revenue Summary
// At the end of the trading period, the owner wants a single figure that shows how much revenue
// the truck has generated across all recorded orders. This number will be used in their
// financial summary report, so the result should be returned as a single value named total_revenue.
//
// Hint: Write an aggregation query on the orders collection to calculate the total revenue from all orders combined.
// The result should be a single document with a field named total_revenue.

// Bonus: The dataset is identical in the PostgreSQL database, meaning the same business insight can be retrieved.
// Write the equivalent query for PostgreSQL. See query_task4_bonus.sql

// ---------------------------------------------------------------
// Your thinking process (required)
// ---------------------------------------------------------------
// Before writing your query, explain in your own words how you
// interpreted the task, what data you need, which collection(s)
// are involved, and what MongoDB concepts you plan to use.
// Write in English or Thai. Do not skip this step.
//
// Your thinking : [โจทย์] เจ้าของร้านต้อง รายได้ทั้งหมดจากออร์เดอร์ที่บันทึกไว้
//      >>> [จากคำใบ้] >>> ข้อมูลที่ต้องการอยู่ใน orders
//      [สำหรับ mongoDB] 1.หาราคาจากฟิลด์ total_price ใน กรณีที่มากกว่าหรือเท่ากับ 100 ต้องใช้ .find() และ $gte
//      [ผลลัพธ์ (query) > ชื่อ] ต้องเป็น Beef Patty , Veggie Patty , Burger Bun , Cheese Slice ,Bacon , Potatoes
//

db.orders.aggregate([
  {
    $group: {
      _id: null,
      total_revenue: { $sum: "$total_price" }
    }
  },
  {
    $project: {
      _id: 0,
      total_revenue: 1
    }
  }
])