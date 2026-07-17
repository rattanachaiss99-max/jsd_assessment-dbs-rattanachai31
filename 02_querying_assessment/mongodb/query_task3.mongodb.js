// Task 3: Stock Replenishment Check
// Before placing the weekly supply order, the manager wants to avoid over-ordering ingredients
// that are already well-stocked. They need a list of every ingredient with a stock level
// of 100 or more so those can be deprioritised in this week's order.
//
// Hint: Write a query to find all ingredients in the ingredients collection that have a stock_level of 100.00 or more.

// Bonus: The dataset is identical in the PostgreSQL database, meaning the same business insight can be retrieved.
// Write the equivalent query for PostgreSQL. See query_task3_bonus.sql

// ---------------------------------------------------------------
// Your thinking process (required)
// ---------------------------------------------------------------
// Before writing your query, explain in your own words how you
// interpreted the task, what data you need, which collection(s)
// are involved, and what MongoDB concepts you plan to use.
// Write in English or Thai. Do not skip this step.
//
// Your thinking: [โจทย์] ผู้จัดการต้องการสต็อกตั้งแต่ 100 ขึ้นไป จะได้ไม่ต้องสั่งเพิ่ม
//      >>> [จากคำใบ้] >>> ข้อมูลที่ต้องการอยู่ใน ingredients
//      [สำหรับ mongoDB] 1.หาชื่อจาก stock_level ใน กรณีที่มากกว่าหรือเท่ากับ 100 ต้องใช้ .find() และ $gte
//      [ผลลัพธ์ (query) > ชื่อ] ต้องเป็น Beef Patty , Veggie Patty , Burger Bun , Cheese Slice ,Bacon , Potatoes
//      
//      

db.ingredients.find({ 
  stock_level: { $gte: Decimal128("100.00") } 
})