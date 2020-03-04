Category.create!([
  {category_name: "Lunch", description: "", created_by: 1, updated_by: nil, deleted_at: nil},
  {category_name: "Breakfast", description: "Morning Food", created_by: 1, updated_by: nil, deleted_at: nil},
  {category_name: "Mid-day Snacks", description: "Snacks for School", created_by: 1, updated_by: nil, deleted_at: nil},
  {category_name: "Dinner", description: "Night Food", created_by: 1, updated_by: nil, deleted_at: nil},
  {category_name: "Tea Break - Morning", description: "Morning Tea Time", created_by: 1, updated_by: 1, deleted_at: nil},
  {category_name: "Tea Break - Evening", description: "Evening Tea Time", created_by: 1, updated_by: 1, deleted_at: nil}
])
FoodCategory.create!([
  {name: "Veg", description: "The foods sourced from vegetables but also includes Honey & Dairy products", created_by: 1, updated_by: 1, deleted_at: nil},
  {name: "Jain", description: "These kind of peoples consumes Veg foods excepts and also avoids taking honey, dairy products, roots & tubers, cinnamon, butter, etc.", created_by: 1, updated_by: 1, deleted_at: nil}
])

Kitchen.create!([
  {name: "Idlidabba - saravanampatti", responsible_person: "Vivek", address: "Saravanampatti,Cbe", created_by: nil, updated_by: 1, deleted_at: nil}
])
SiteCategory.create!([
  {name: "Corporate", description: nil, created_by: 1, updated_by: nil, deleted_at: nil},
  {name: "School", description: nil, created_by: 1, updated_by: 1, deleted_at: nil}
])
ClientCategory.create!([{name: "Primary"},{name: "Secondary"},{name: "Corporate-Regular"},{name: "Corporate-Counter"}])
Role.create!([
  {name: "CEO", site_category_id:1, created_by: nil, updated_by: nil, deleted_at: nil},
  {name: "Administrator", site_category_id: 1, created_by: nil, updated_by: nil, deleted_at: nil},
  {name: "Chef", site_category_id: 1, created_by: nil, updated_by: nil, deleted_at: nil},
  {name: "Nutrition", site_category_id: 1, created_by: nil, updated_by: nil, deleted_at: nil},
  {name: "Audit Incharge", site_category_id: 1, created_by: nil, updated_by: nil, deleted_at: nil},
  {name: "Dispatch Incharge", site_category_id: 1, created_by: nil, updated_by: nil, deleted_at: nil},
  {name: "Admin", site_category_id: 2, created_by: nil, updated_by: nil, deleted_at: nil},
  {name: "Head", site_category_id: 2, created_by: nil, updated_by: nil, deleted_at: nil},
  {name: "Audit Manager", site_category_id: 1, created_by: nil, updated_by: nil, deleted_at: nil},
  {name: "Dispatch Manager", site_category_id: 1, created_by: nil, updated_by: nil, deleted_at: nil},
  {name: "Delivery Incharge", site_category_id: 1, created_by: nil, updated_by: nil, deleted_at: nil}
])
KitchenUser.create!([
    {name: "Vivek  Chidambaram", user_name: "vivek", password_digest: "vivek", email: "ceo@idlidabba.com", mobile_number: "9842318000", address: "10C, Eye Hospital Road, Vilankuruchi Rd, Sivanandh...", auth_token: "267b453c118802ee6d74dcd5cea4f325", role_id: 1, kitchen_id: 1, tenant: [4], created_by: nil, updated_by: 1, status: false, is_logged_in: true, deleted_at: nil}
  ])