class AddDeletedAtToTenants < ActiveRecord::Migration[5.0]
  def change
    add_column :tenants, :deleted_at, :datetime
    add_index :tenants, :deleted_at
    add_column :alleries, :deleted_at, :datetime
    add_index :alleries, :deleted_at
    add_column :answers, :deleted_at, :datetime
    add_index :answers, :deleted_at
    add_column :attendances, :deleted_at, :datetime
    add_index :attendances, :deleted_at
    add_column :auditreviews, :deleted_at, :datetime
    add_index :auditreviews, :deleted_at
    add_column :categories, :deleted_at, :datetime
    add_index :categories, :deleted_at
    add_column :comments, :deleted_at, :datetime
    add_index :comments, :deleted_at
    add_column :customer_view_controls, :deleted_at, :datetime
    add_index :customer_view_controls, :deleted_at
    add_column :deliveries, :deleted_at, :datetime
    add_index :deliveries, :deleted_at
    add_column :delivery_histories, :deleted_at, :datetime
    add_index :delivery_histories, :deleted_at
    add_column :dispatch_utensils_mappings, :deleted_at, :datetime
    add_index :dispatch_utensils_mappings, :deleted_at
    add_column :dispatches, :deleted_at, :datetime
    add_index :dispatches, :deleted_at
    add_column :enrolments, :deleted_at, :datetime
    add_index :enrolments, :deleted_at
    add_column :feedbacks, :deleted_at, :datetime
    add_index :feedbacks, :deleted_at
    add_column :food_categories, :deleted_at, :datetime
    add_index :food_categories, :deleted_at
    add_column :food_groups, :deleted_at, :datetime
    add_index :food_groups, :deleted_at
    add_column :food_returns, :deleted_at, :datetime
    add_index :food_returns, :deleted_at
    add_column :images, :deleted_at, :datetime
    add_index :images, :deleted_at
    add_column :imageuploads, :deleted_at, :datetime
    add_index :imageuploads, :deleted_at
    add_column :item_categories, :deleted_at, :datetime
    add_index :item_categories, :deleted_at
    add_column :item_meal_courses, :deleted_at, :datetime
    add_index :item_meal_courses, :deleted_at
    add_column :item_meal_restrictions, :deleted_at, :datetime
    add_index :item_meal_restrictions, :deleted_at
    add_column :item_subcategories, :deleted_at, :datetime
    add_index :item_subcategories, :deleted_at
    add_column :kitchen_users, :deleted_at, :datetime
    add_index :kitchen_users, :deleted_at
    add_column :kitchens, :deleted_at, :datetime
    add_index :kitchens, :deleted_at
    add_column :map_details, :deleted_at, :datetime
    add_index :map_details, :deleted_at
    add_column :meal_courses, :deleted_at, :datetime
    add_index :meal_courses, :deleted_at
    add_column :meal_restrictions, :deleted_at, :datetime
    add_index :meal_restrictions, :deleted_at
    add_column :menu_customer_dispatches, :deleted_at, :datetime
    add_index :menu_customer_dispatches, :deleted_at
    add_column :menu_customers, :deleted_at, :datetime
    add_index :menu_customers, :deleted_at
    add_column :menu_masters, :deleted_at, :datetime
    add_index :menu_masters, :deleted_at
    add_column :menu_production_items, :deleted_at, :datetime
    add_index :menu_production_items, :deleted_at
    add_column :menureviews, :deleted_at, :datetime
    add_index :menureviews, :deleted_at
    add_column :nutritions, :deleted_at, :datetime
    add_index :nutritions, :deleted_at
    add_column :parent_orders, :deleted_at, :datetime
    add_index :parent_orders, :deleted_at
    add_column :point_of_sales, :deleted_at, :datetime
    add_index :point_of_sales, :deleted_at
    add_column :production_categories, :deleted_at, :datetime
    add_index :production_categories, :deleted_at
    add_column :production_item_images, :deleted_at, :datetime
    add_index :production_item_images, :deleted_at
    add_column :production_items, :deleted_at, :datetime
    add_index :production_items, :deleted_at
    add_column :questions, :deleted_at, :datetime
    add_index :questions, :deleted_at
    add_column :roles, :deleted_at, :datetime
    add_index :roles, :deleted_at
    add_column :site_categories, :deleted_at, :datetime
    add_index :site_categories, :deleted_at
    add_column :software_setups, :deleted_at, :datetime
    add_index :software_setups, :deleted_at
    add_column :standards, :deleted_at, :datetime
    add_index :standards, :deleted_at
    add_column :student_feedbacks, :deleted_at, :datetime
    add_index :student_feedbacks, :deleted_at
    add_column :tenant_details, :deleted_at, :datetime
    add_index :tenant_details, :deleted_at
    add_column :unit_of_measurements, :deleted_at, :datetime
    add_index :unit_of_measurements, :deleted_at
    add_column :users, :deleted_at, :datetime
    add_index :users, :deleted_at
    add_column :utensils, :deleted_at, :datetime
    add_index :utensils, :deleted_at
    add_column :utensils_categories, :deleted_at, :datetime
    add_index :utensils_categories, :deleted_at
    add_column :wastages, :deleted_at, :datetime
    add_index :wastages, :deleted_at
    
     








  end
end

