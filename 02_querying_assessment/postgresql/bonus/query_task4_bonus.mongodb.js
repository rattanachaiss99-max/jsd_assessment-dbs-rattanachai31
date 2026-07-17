// Task 4 Bonus: Supplier Dependency Check
// The manager has just heard that 'Freshest Farm Produce' may be delayed on their next delivery.
// Before deciding whether to source from an alternative supplier, they need to know exactly
// which ingredients depend on that supplier, so they can assess the impact on the menu.
//
// The dataset is identical in MongoDB — the same business insight can be retrieved.
//
// Hint: In the ingredients collection, supplier references are stored as ObjectIds rather than names.
// Use an aggregation pipeline with $lookup to join the ingredients collection with the suppliers
// collection, then filter where the supplier name is 'Freshest Farm Produce' and return
// only the ingredient names.
//
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
//                      1.ใช้ .aggregate และ .lookup แก้ไข normalize (ข้อมูลกระจาย)
//                      2.เงื่อนไข $lookup จาก suppliers โดยเทียบค่า supplier_id ในชื่อใหม่ supplier_info
//                      3.$match เพื่อกรองหาเฉพาะ 'Freshest Farm Produce'
//                      4.$project แสดงชื่อของวัตถุดิบที่ต้องการ
//      [ผลลัพธ์] > ชื่อ และจำนวนออร์เดอร์
//

db.ingredients.aggregate([
  {
    $lookup: {
      from: "suppliers",            
      localField: "supplier_id",    
      foreignField: "supplier_id",  
      as: "supplier_info"
    }
  },
  {
    $match: {
      "supplier_info.name": "Freshest Farm Produce"
    }
  },
  {
    $project: {
      _id: 0,
      name: 1
    }
  }
])

// Output
// [
//   { "name": "Lettuce" },
//   { "name": "Tomato" },
//   { "name": "Special Sauce" },
//   { "name": "Potatoes" },
//   { "name": "Onions" }
// ]

//Database
// db.ingredients.insertMany([
//   { ingredient_id: 1, name: "Beef Patty", stock_level: 200, unit: "units", supplier_id: 1 },
//   { ingredient_id: 2, name: "Veggie Patty", stock_level: 100, unit: "units", supplier_id: 1 },
//   { ingredient_id: 3, name: "Burger Bun", stock_level: 300, unit: "units", supplier_id: 2 },
//   { ingredient_id: 4, name: "Lettuce", stock_level: 20, unit: "heads", supplier_id: 3 },
//   { ingredient_id: 5, name: "Tomato", stock_level: 50, unit: "units", supplier_id: 3 },
//   { ingredient_id: 6, name: "Cheese Slice", stock_level: 400, unit: "slices", supplier_id: 1 },
//   { ingredient_id: 7, name: "Bacon", stock_level: 150, unit: "strips", supplier_id: 1 },
//   { ingredient_id: 8, name: "Special Sauce", stock_level: 10, unit: "liters", supplier_id: 3 },
//   { ingredient_id: 9, name: "Potatoes", stock_level: 100, unit: "kg", supplier_id: 3 },
//   { ingredient_id: 10, name: "Onions", stock_level: 25, unit: "kg", supplier_id: 3 }
// ]);


//Database
// db.suppliers.insertMany([
//   { supplier_id: 1, name: "Patty's Premium Meats", contact_person: "Patty Smith", phone_number: "555-0101" },
//   { supplier_id: 2, name: "The Bun Barn", contact_person: "Brad Breadson", phone_number: "555-0102" },
//   { supplier_id: 3, name: "Freshest Farm Produce", contact_person: "Frank Farmer", phone_number: "555-0103" }
// ]);