// Task 1 Bonus: Sides Menu Board
// The owner wants to update the printed menu board that displays only the side dishes.
// They need a list of every item in the 'Side' category along with its current price,
// so the designer can produce an accurate board without having to check each item manually.
//
// The dataset is identical in MongoDB — the same business insight can be retrieved.
//
// Hint: Write a query on the menu_items collection to find the name and price
// of all documents where the category is 'Side'.

// ---------------------------------------------------------------
// Your thinking process (required)
// ---------------------------------------------------------------
// Before writing your query, explain in your own words how you
// interpreted the task, what data you need, which collection(s)
// are involved, and what MongoDB concepts you plan to use.
// Write in English or Thai. Do not skip this step.
//
// Your thinking: [โจทย์]เป้าหมายเดียวกับ query_task1.sql คือต้องการปริ้นเมนู แสดงเฉพาะหมวดหมู่เครื่องเคียง
// >>>  [จากคำใบ้] > ข้อมูลที่ต้องการอยู่ menu_items ฟิลด์ name และ price
//      [สำหรับ mongoDB] 0.สร้าง DB แบบ PGSQL พร้อม decimal128
//                      1. ใช้ .find(query, projection)
//                      2.กรองข้อมูลในหมวด 'Side'
//                      3.กำหนดข้อมูลที่แสดง/ไม่แสดง name , price (1) และ _id(0)
//      [ผลลัพธ์] > ต้องได้ Classice Fries , Onion Rings
//

db.menu_items.find(
  { category: "Side" },
  { name: 1, price: 1, _id: 0 }
)

// Output
// [
//   { "name": "Classic Fries", "price": 5.00 },
//   { "name": "Onion Rings", "price": 6.00 }
// ]

// Database
// db.menu_items.insertMany([
//   {
//     item_id: 1, 
//     name: "The All-American",
//     description: "A classic beef burger with lettuce, tomato, and our special sauce.",
//     price: Decimal128("12.50"), 
//     category: "Burger"
//   },
//   {
//     item_id: 2,
//     name: "Bacon Cheeseburger",
//     description: "Our classic burger topped with crispy bacon and melted cheese.",
//     price: Decimal128("14.00"),
//     category: "Burger"
//   },
//   {
//     item_id: 3,
//     name: "The Aloha Burger",
//     description: "A beef burger with a tropical twist, featuring grilled pineapple.",
//     price: Decimal128("13.50"),
//     category: "Burger"
//   },
//   {
//     item_id: 4,
//     name: "Veggie Burger",
//     description: "A delicious plant-based patty with all the fixings.",
//     price: Decimal128("11.50"),
//     category: "Burger"
//   },
//   {
//     item_id: 5,
//     name: "Classic Fries",
//     description: "Golden and crispy french fries.",
//     price: Decimal128("5.00"),
//     category: "Side"
//   },
//   {
//     item_id: 6,
//     name: "Onion Rings",
//     description: "Battered and fried to perfection.",
//     price: Decimal128("6.00"),
//     category: "Side"
//   },
//   {
//     item_id: 7,
//     name: "Soda",
//     description: "Choose from a variety of classic sodas.",
//     price: Decimal128("2.50"),
//     category: "Drink"
//   },
//   {
//     item_id: 8,
//     name: "Bottled Water",
//     description: "Pure and simple.",
//     price: Decimal128("2.00"),
//     category: "Drink"
//   }
// ]);