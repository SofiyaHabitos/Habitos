# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20191226122051) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "alleries", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "description"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_alleries_on_deleted_at", using: :btree
    t.index ["name"], name: "index_alleries_on_name", unique: true, using: :btree
  end

  create_table "answers", force: :cascade do |t|
    t.integer  "question_id"
    t.string   "answer"
    t.integer  "tenant_id"
    t.string   "meal_time"
    t.date     "date"
    t.integer  "image_id"
    t.string   "command"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_answers_on_deleted_at", using: :btree
    t.index ["image_id"], name: "index_answers_on_image_id", using: :btree
    t.index ["question_id"], name: "index_answers_on_question_id", using: :btree
    t.index ["tenant_id"], name: "index_answers_on_tenant_id", using: :btree
  end

  create_table "assetstatuses", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "utensilname_id"
    t.integer  "kitchen_id"
    t.datetime "date"
    t.integer  "count"
    t.string   "status"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["kitchen_id"], name: "index_assetstatuses_on_kitchen_id", using: :btree
    t.index ["tag_id"], name: "index_assetstatuses_on_tag_id", using: :btree
    t.index ["utensilname_id"], name: "index_assetstatuses_on_utensilname_id", using: :btree
  end

  create_table "attendances", force: :cascade do |t|
    t.string   "age_type"
    t.boolean  "attendance_log",     default: true
    t.integer  "tenant_id"
    t.date     "date"
    t.string   "identity_number"
    t.string   "standard"
    t.string   "meal_time"
    t.integer  "enrolment_id"
    t.integer  "food_category_id"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "normalmenu_site_id"
    t.integer  "menu_customer_id"
    t.string   "academic_year"
    t.string   "stud_type"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_attendances_on_deleted_at", using: :btree
    t.index ["enrolment_id"], name: "index_attendances_on_enrolment_id", using: :btree
    t.index ["food_category_id"], name: "index_attendances_on_food_category_id", using: :btree
    t.index ["menu_customer_id"], name: "index_attendances_on_menu_customer_id", using: :btree
    t.index ["normalmenu_site_id"], name: "index_attendances_on_normalmenu_site_id", using: :btree
    t.index ["tenant_id"], name: "index_attendances_on_tenant_id", using: :btree
  end

  create_table "audit_feedback_categories", force: :cascade do |t|
    t.string   "category_name"
    t.string   "category_desc"
    t.integer  "status"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "audit_feedback_questions", force: :cascade do |t|
    t.string   "feedback_question"
    t.string   "feedback_question_desc"
    t.integer  "feedback_question_type"
    t.string   "feedback_question_options"
    t.boolean  "feedback_image"
    t.boolean  "feedback_comments"
    t.integer  "status"
    t.integer  "audit_feedback_category_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["audit_feedback_category_id"], name: "index_audit_feedback_questions_on_audit_feedback_category_id", using: :btree
  end

  create_table "audit_feedback_reports", force: :cascade do |t|
    t.datetime "audit_date"
    t.string   "feedback_meal_course"
    t.string   "feedback_audit_by"
    t.string   "feedback_answer"
    t.text     "feedback_image"
    t.string   "feedback_comment"
    t.integer  "audit_feedback_category_id"
    t.integer  "audit_feedback_question_id"
    t.integer  "tenant_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["audit_feedback_category_id"], name: "index_audit_feedback_reports_on_audit_feedback_category_id", using: :btree
    t.index ["audit_feedback_question_id"], name: "index_audit_feedback_reports_on_audit_feedback_question_id", using: :btree
    t.index ["tenant_id"], name: "index_audit_feedback_reports_on_tenant_id", using: :btree
  end

  create_table "auditreviews", force: :cascade do |t|
    t.string   "correct"
    t.string   "incorrect"
    t.date     "date"
    t.integer  "tenant_id"
    t.string   "meal_time"
    t.string   "category"
    t.string   "rating"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_auditreviews_on_deleted_at", using: :btree
    t.index ["tenant_id"], name: "index_auditreviews_on_tenant_id", using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string   "category_name", null: false
    t.string   "description"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.datetime "deleted_at"
    t.integer  "position"
    t.index ["category_name"], name: "index_categories_on_category_name", unique: true, using: :btree
    t.index ["deleted_at"], name: "index_categories_on_deleted_at", using: :btree
  end

  create_table "client_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "client_spread_types", force: :cascade do |t|
    t.integer  "site_category_id"
    t.integer  "spread_type_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["site_category_id"], name: "index_client_spread_types_on_site_category_id", using: :btree
  end

  create_table "client_type_categories", force: :cascade do |t|
    t.integer  "site_category_id"
    t.integer  "client_category_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["client_category_id"], name: "index_client_type_categories_on_client_category_id", using: :btree
    t.index ["site_category_id"], name: "index_client_type_categories_on_site_category_id", using: :btree
  end

  create_table "comments", force: :cascade do |t|
    t.string   "othercomment"
    t.integer  "tenant_id"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_comments_on_deleted_at", using: :btree
    t.index ["tenant_id"], name: "index_comments_on_tenant_id", using: :btree
  end

  create_table "customer_view_controls", force: :cascade do |t|
    t.integer  "tenant_id"
    t.string   "title"
    t.string   "billing_upload"
    t.string   "nutrition_upload"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.datetime "deleted_at"
    t.string   "bill"
    t.index ["deleted_at"], name: "index_customer_view_controls_on_deleted_at", using: :btree
    t.index ["tenant_id"], name: "index_customer_view_controls_on_tenant_id", using: :btree
  end

  create_table "daily_transactions", force: :cascade do |t|
    t.string   "date"
    t.string   "tenant_name"
    t.string   "category_name"
    t.string   "stud_type"
    t.string   "menu_master_name"
    t.integer  "pack_to_send"
    t.string   "meal_restriction_name"
    t.string   "food_category"
    t.text     "items"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "dc_vesseldispatch_mappings", force: :cascade do |t|
    t.integer  "delivery_challan_id"
    t.integer  "vessel_dispatch_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["delivery_challan_id"], name: "index_dc_vesseldispatch_mappings_on_delivery_challan_id", using: :btree
    t.index ["vessel_dispatch_id"], name: "index_dc_vesseldispatch_mappings_on_vessel_dispatch_id", using: :btree
  end

  create_table "deliveries", force: :cascade do |t|
    t.date     "date"
    t.integer  "tenant_id"
    t.string   "remark"
    t.string   "delivery_status"
    t.integer  "dispatch_id"
    t.string   "distance"
    t.string   "meal_time"
    t.string   "delivery_time"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "time"
    t.integer  "delivery_history_id"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_deliveries_on_deleted_at", using: :btree
    t.index ["delivery_history_id"], name: "index_deliveries_on_delivery_history_id", using: :btree
    t.index ["dispatch_id"], name: "index_deliveries_on_dispatch_id", using: :btree
    t.index ["tenant_id"], name: "index_deliveries_on_tenant_id", using: :btree
  end

  create_table "delivery_challans", force: :cascade do |t|
    t.string   "dc_no"
    t.string   "file_path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "delivery_histories", force: :cascade do |t|
    t.date     "date"
    t.integer  "tenant_id"
    t.string   "start_time"
    t.string   "stop_time"
    t.string   "pause_time",                    array: true
    t.string   "resume_time",                   array: true
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "driver_name"
    t.integer  "menu_customer_id"
    t.integer  "category_id"
    t.datetime "deleted_at"
    t.index ["category_id"], name: "index_delivery_histories_on_category_id", using: :btree
    t.index ["deleted_at"], name: "index_delivery_histories_on_deleted_at", using: :btree
    t.index ["menu_customer_id"], name: "index_delivery_histories_on_menu_customer_id", using: :btree
    t.index ["tenant_id"], name: "index_delivery_histories_on_tenant_id", using: :btree
  end

  create_table "delivery_orders", force: :cascade do |t|
    t.date     "date"
    t.string   "meal_time"
    t.string   "driver_name"
    t.integer  "tenant_destination",  default: [],              array: true
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.hstore   "tenant_destinations"
  end

  create_table "departments", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "depriciation_categories", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.float    "depreciation_percentage"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "dispatch_utensils_mappings", force: :cascade do |t|
    t.integer  "dispatch_id"
    t.integer  "utensil_id"
    t.string   "status"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "tenant_id"
    t.integer  "count_dummy"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_dispatch_utensils_mappings_on_deleted_at", using: :btree
    t.index ["dispatch_id"], name: "index_dispatch_utensils_mappings_on_dispatch_id", using: :btree
    t.index ["tenant_id"], name: "index_dispatch_utensils_mappings_on_tenant_id", using: :btree
    t.index ["utensil_id"], name: "index_dispatch_utensils_mappings_on_utensil_id", using: :btree
  end

  create_table "dispatches", force: :cascade do |t|
    t.date     "date"
    t.integer  "tenant_id"
    t.integer  "utensil_id"
    t.integer  "unit_of_measurement_id"
    t.float    "quantity"
    t.string   "meal_time"
    t.string   "status"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.boolean  "is_checked",              default: false
    t.string   "reason"
    t.integer  "menu_production_item_id"
    t.float    "delivery_qty"
    t.integer  "count_dummy"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_dispatches_on_deleted_at", using: :btree
    t.index ["menu_production_item_id"], name: "index_dispatches_on_menu_production_item_id", using: :btree
    t.index ["tenant_id"], name: "index_dispatches_on_tenant_id", using: :btree
    t.index ["unit_of_measurement_id"], name: "index_dispatches_on_unit_of_measurement_id", using: :btree
    t.index ["utensil_id"], name: "index_dispatches_on_utensil_id", using: :btree
  end

  create_table "drivers", force: :cascade do |t|
    t.string   "driver_name"
    t.string   "vehicle_no"
    t.string   "vehicle_type"
    t.string   "contact_no"
    t.string   "proof"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "username"
    t.string   "password"
    t.string   "email"
    t.string   "team_id"
    t.string   "last_name"
    t.integer  "role_id"
    t.integer  "fleet_id"
    t.string   "licence_no"
    t.datetime "license_exp"
    t.string   "driver_image"
    t.string   "reg_no"
    t.string   "vehicle_owner"
    t.string   "vehicle_contact"
  end

  create_table "enrolments", force: :cascade do |t|
    t.string   "name"
    t.string   "age_type"
    t.date     "date_of_birth"
    t.float    "height"
    t.float    "weight"
    t.float    "bmi"
    t.string   "standard"
    t.string   "id_number"
    t.integer  "food_category_id"
    t.string   "enrolment_type"
    t.integer  "tenant_id"
    t.string   "order_source"
    t.string   "email"
    t.string   "sex"
    t.string   "parent_name"
    t.string   "meal_time"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.date     "from_date"
    t.date     "to_date"
    t.integer  "meal_restriction_id"
    t.text     "comment"
    t.boolean  "is_active",           default: true
    t.datetime "deleted_at"
    t.string   "status"
    t.string   "stud_type"
    t.string   "academic_year"
    t.index ["deleted_at"], name: "index_enrolments_on_deleted_at", using: :btree
    t.index ["food_category_id"], name: "index_enrolments_on_food_category_id", using: :btree
    t.index ["meal_restriction_id"], name: "index_enrolments_on_meal_restriction_id", using: :btree
    t.index ["tenant_id"], name: "index_enrolments_on_tenant_id", using: :btree
  end

  create_table "feedback_statuses", force: :cascade do |t|
    t.string   "date"
    t.string   "cusotmer"
    t.string   "meal_time"
    t.string   "meal_name"
    t.string   "chef"
    t.string   "rating"
    t.string   "boiled"
    t.string   "spicy"
    t.string   "salt"
    t.string   "ind_comment"
    t.string   "shortage_count"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "feedbacks", force: :cascade do |t|
    t.string   "username"
    t.string   "age_type"
    t.integer  "rating"
    t.integer  "tenant_id"
    t.string   "favourite_dish"
    t.string   "least_dish"
    t.string   "comment"
    t.string   "reason"
    t.date     "date"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "flag"
    t.datetime "deleted_at"
    t.string   "status"
    t.index ["deleted_at"], name: "index_feedbacks_on_deleted_at", using: :btree
    t.index ["tenant_id"], name: "index_feedbacks_on_tenant_id", using: :btree
  end

  create_table "food_categories", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "description"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_food_categories_on_deleted_at", using: :btree
    t.index ["name"], name: "index_food_categories_on_name", unique: true, using: :btree
  end

  create_table "food_groups", force: :cascade do |t|
    t.string   "meal_time"
    t.integer  "food_category_id"
    t.text     "description"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "image_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_food_groups_on_deleted_at", using: :btree
    t.index ["food_category_id"], name: "index_food_groups_on_food_category_id", using: :btree
    t.index ["image_id"], name: "index_food_groups_on_image_id", using: :btree
  end

  create_table "food_returns", force: :cascade do |t|
    t.date     "date"
    t.integer  "tenant_id"
    t.string   "meal_time"
    t.string   "reason"
    t.string   "remark"
    t.integer  "image_id"
    t.float    "quantity"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "menu_production_item_id"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_food_returns_on_deleted_at", using: :btree
    t.index ["image_id"], name: "index_food_returns_on_image_id", using: :btree
    t.index ["menu_production_item_id"], name: "index_food_returns_on_menu_production_item_id", using: :btree
    t.index ["tenant_id"], name: "index_food_returns_on_tenant_id", using: :btree
  end

  create_table "foodmenus", force: :cascade do |t|
    t.integer  "tenant_id"
    t.string   "date"
    t.string   "meal_time"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tenant_id"], name: "index_foodmenus_on_tenant_id", using: :btree
  end

  create_table "images", force: :cascade do |t|
    t.string   "image_path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_images_on_deleted_at", using: :btree
  end

  create_table "imageuploads", force: :cascade do |t|
    t.string   "comment"
    t.string   "image_upload"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_imageuploads_on_deleted_at", using: :btree
  end

  create_table "ingredient_categories", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "description"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["name"], name: "index_ingredient_categories_on_name", unique: true, using: :btree
  end

  create_table "ingredients", force: :cascade do |t|
    t.string   "name"
    t.integer  "ingredient_category_id"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["ingredient_category_id"], name: "index_ingredients_on_ingredient_category_id", using: :btree
    t.index ["name"], name: "index_ingredients_on_name", unique: true, using: :btree
  end

  create_table "inventory_logs", force: :cascade do |t|
    t.integer  "stock_in_id"
    t.integer  "stock_out_id"
    t.integer  "ingredient_id"
    t.float    "quantity"
    t.integer  "unit_of_measurement_id"
    t.boolean  "log_status",             default: true
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.index ["ingredient_id"], name: "index_inventory_logs_on_ingredient_id", using: :btree
    t.index ["stock_in_id"], name: "index_inventory_logs_on_stock_in_id", using: :btree
    t.index ["stock_out_id"], name: "index_inventory_logs_on_stock_out_id", using: :btree
    t.index ["unit_of_measurement_id"], name: "index_inventory_logs_on_unit_of_measurement_id", using: :btree
  end

  create_table "item_categories", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "no_of_category"
    t.string   "super_category_name"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.datetime "deleted_at"
    t.index ["category_id"], name: "index_item_categories_on_category_id", using: :btree
    t.index ["deleted_at"], name: "index_item_categories_on_deleted_at", using: :btree
  end

  create_table "item_meal_courses", force: :cascade do |t|
    t.integer  "production_item_id"
    t.integer  "meal_course_id"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_item_meal_courses_on_deleted_at", using: :btree
    t.index ["meal_course_id"], name: "index_item_meal_courses_on_meal_course_id", using: :btree
    t.index ["production_item_id"], name: "index_item_meal_courses_on_production_item_id", using: :btree
  end

  create_table "item_meal_restrictions", force: :cascade do |t|
    t.integer  "production_item_id"
    t.integer  "meal_restriction_id"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_item_meal_restrictions_on_deleted_at", using: :btree
    t.index ["meal_restriction_id"], name: "index_item_meal_restrictions_on_meal_restriction_id", using: :btree
    t.index ["production_item_id"], name: "index_item_meal_restrictions_on_production_item_id", using: :btree
  end

  create_table "item_subcategories", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "create_by"
    t.integer  "updated_by"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_item_subcategories_on_deleted_at", using: :btree
    t.index ["name"], name: "index_item_subcategories_on_name", unique: true, using: :btree
  end

  create_table "kitchen_users", force: :cascade do |t|
    t.string   "name",                            null: false
    t.string   "user_name",                       null: false
    t.string   "password_digest"
    t.string   "email",                           null: false
    t.string   "mobile_number"
    t.text     "address"
    t.string   "auth_token"
    t.integer  "role_id"
    t.integer  "kitchen_id"
    t.integer  "tenant",          default: [],                 array: true
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "status"
    t.boolean  "is_logged_in",    default: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_kitchen_users_on_deleted_at", using: :btree
    t.index ["kitchen_id"], name: "index_kitchen_users_on_kitchen_id", using: :btree
    t.index ["role_id"], name: "index_kitchen_users_on_role_id", using: :btree
    t.index ["user_name"], name: "index_kitchen_users_on_user_name", unique: true, using: :btree
  end

  create_table "kitchens", force: :cascade do |t|
    t.string   "name",               null: false
    t.string   "responsible_person"
    t.string   "address"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_kitchens_on_deleted_at", using: :btree
    t.index ["name"], name: "index_kitchens_on_name", unique: true, using: :btree
  end

  create_table "map_details", force: :cascade do |t|
    t.string   "latitude"
    t.string   "longitude"
    t.datetime "time"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_map_details_on_deleted_at", using: :btree
  end

  create_table "meal_courses", force: :cascade do |t|
    t.string   "meal_course_name"
    t.string   "description"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "position"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_meal_courses_on_deleted_at", using: :btree
  end

  create_table "meal_restrictions", force: :cascade do |t|
    t.string   "meal_restriction_name"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_meal_restrictions_on_deleted_at", using: :btree
  end

  create_table "mealcounts", force: :cascade do |t|
    t.string   "veg_count"
    t.string   "non_veg_count"
    t.integer  "food_category_id"
    t.string   "meal_time"
    t.date     "date"
    t.integer  "tenant_id"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["food_category_id"], name: "index_mealcounts_on_food_category_id", using: :btree
    t.index ["tenant_id"], name: "index_mealcounts_on_tenant_id", using: :btree
  end

  create_table "menu_customer_dispatches", force: :cascade do |t|
    t.integer  "menu_customer_id"
    t.integer  "dispatch_id"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_menu_customer_dispatches_on_deleted_at", using: :btree
    t.index ["dispatch_id"], name: "index_menu_customer_dispatches_on_dispatch_id", using: :btree
    t.index ["menu_customer_id"], name: "index_menu_customer_dispatches_on_menu_customer_id", using: :btree
  end

  create_table "menu_customers", force: :cascade do |t|
    t.date     "date"
    t.integer  "tenant_id"
    t.integer  "menu_master_id"
    t.integer  "category_id"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "delivery_status"
    t.string   "status"
    t.boolean  "is_fully_dispatched"
    t.boolean  "attendance_flag",     default: false
    t.integer  "flag"
    t.integer  "packs_to_send"
    t.integer  "meal_restriction_id"
    t.string   "order_no"
    t.datetime "deleted_at"
    t.string   "stud_type"
    t.index ["category_id"], name: "index_menu_customers_on_category_id", using: :btree
    t.index ["deleted_at"], name: "index_menu_customers_on_deleted_at", using: :btree
    t.index ["meal_restriction_id"], name: "index_menu_customers_on_meal_restriction_id", using: :btree
    t.index ["menu_master_id"], name: "index_menu_customers_on_menu_master_id", using: :btree
    t.index ["tenant_id"], name: "index_menu_customers_on_tenant_id", using: :btree
  end

  create_table "menu_cycles", force: :cascade do |t|
    t.integer  "sub_plan_id"
    t.integer  "category_id"
    t.text     "menu_items"
    t.datetime "date"
    t.integer  "tenant_detail_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.float    "quantity"
    t.string   "status"
    t.index ["category_id"], name: "index_menu_cycles_on_category_id", using: :btree
    t.index ["sub_plan_id"], name: "index_menu_cycles_on_sub_plan_id", using: :btree
    t.index ["tenant_detail_id"], name: "index_menu_cycles_on_tenant_detail_id", using: :btree
  end

  create_table "menu_masters", force: :cascade do |t|
    t.string   "menu_master_name"
    t.integer  "category_id"
    t.string   "cost"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "food_category_id"
    t.integer  "meal_restriction_id"
    t.integer  "allery_id"
    t.datetime "deleted_at"
    t.string   "stud_type"
    t.index ["allery_id"], name: "index_menu_masters_on_allery_id", using: :btree
    t.index ["category_id"], name: "index_menu_masters_on_category_id", using: :btree
    t.index ["deleted_at"], name: "index_menu_masters_on_deleted_at", using: :btree
    t.index ["food_category_id"], name: "index_menu_masters_on_food_category_id", using: :btree
    t.index ["meal_restriction_id"], name: "index_menu_masters_on_meal_restriction_id", using: :btree
  end

  create_table "menu_planners", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "sub_plan_id"
    t.text     "menu_items"
    t.string   "date"
    t.integer  "tenant_detail_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["category_id"], name: "index_menu_planners_on_category_id", using: :btree
    t.index ["sub_plan_id"], name: "index_menu_planners_on_sub_plan_id", using: :btree
    t.index ["tenant_detail_id"], name: "index_menu_planners_on_tenant_detail_id", using: :btree
  end

  create_table "menu_production_items", force: :cascade do |t|
    t.integer  "menu_master_id"
    t.integer  "production_item_id"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "quantity"
    t.integer  "meal_course_id"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_menu_production_items_on_deleted_at", using: :btree
    t.index ["meal_course_id"], name: "index_menu_production_items_on_meal_course_id", using: :btree
    t.index ["menu_master_id"], name: "index_menu_production_items_on_menu_master_id", using: :btree
    t.index ["production_item_id"], name: "index_menu_production_items_on_production_item_id", using: :btree
  end

  create_table "menureviews", force: :cascade do |t|
    t.integer  "normal_menu_id"
    t.string   "answer"
    t.integer  "image_id"
    t.string   "reason"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "foodmenu_id"
    t.integer  "menu_production_item_id"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_menureviews_on_deleted_at", using: :btree
    t.index ["foodmenu_id"], name: "index_menureviews_on_foodmenu_id", using: :btree
    t.index ["image_id"], name: "index_menureviews_on_image_id", using: :btree
    t.index ["menu_production_item_id"], name: "index_menureviews_on_menu_production_item_id", using: :btree
    t.index ["normal_menu_id"], name: "index_menureviews_on_normal_menu_id", using: :btree
  end

  create_table "normal_menus", force: :cascade do |t|
    t.float    "quantity"
    t.integer  "nutrition_id"
    t.integer  "normalmenu_site_id"
    t.integer  "food_category_id"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "total_members_count"
    t.index ["food_category_id"], name: "index_normal_menus_on_food_category_id", using: :btree
    t.index ["normalmenu_site_id"], name: "index_normal_menus_on_normalmenu_site_id", using: :btree
    t.index ["nutrition_id"], name: "index_normal_menus_on_nutrition_id", using: :btree
  end

  create_table "normalmenu_sites", force: :cascade do |t|
    t.date     "date"
    t.string   "meal_time"
    t.integer  "flag"
    t.string   "delivery_status"
    t.string   "status"
    t.integer  "tenant_id"
    t.string   "meal_type"
    t.integer  "menu_detail",         default: [],                 array: true
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "time"
    t.boolean  "attendance_flag",     default: false
    t.boolean  "is_fully_dispatched"
    t.index ["tenant_id"], name: "index_normalmenu_sites_on_tenant_id", using: :btree
  end

  create_table "nutritions", force: :cascade do |t|
    t.integer  "production_item_id"
    t.float    "protein",                           null: false
    t.float    "fat",                               null: false
    t.float    "carbohydrates",                     null: false
    t.float    "fibre",                             null: false
    t.json     "minerals",           default: "{}", null: false
    t.json     "vitamins",           default: "{}", null: false
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.float    "caloire"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_nutritions_on_deleted_at", using: :btree
    t.index ["production_item_id"], name: "index_nutritions_on_production_item_id", using: :btree
  end

  create_table "old_enrolments", force: :cascade do |t|
    t.string   "name"
    t.string   "age_type"
    t.date     "date_of_birth"
    t.float    "height"
    t.float    "weight"
    t.float    "bmi"
    t.string   "standard"
    t.string   "id_number"
    t.integer  "food_category_id"
    t.string   "enrolment_type"
    t.integer  "tenant_id"
    t.string   "order_source"
    t.string   "email"
    t.string   "sex"
    t.string   "parent_name"
    t.string   "meal_time"
    t.date     "from_date"
    t.date     "to_date"
    t.integer  "meal_restriction_id"
    t.text     "comment"
    t.boolean  "is_active"
    t.string   "status"
    t.string   "stud_type"
    t.string   "academic_year"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["food_category_id"], name: "index_old_enrolments_on_food_category_id", using: :btree
    t.index ["meal_restriction_id"], name: "index_old_enrolments_on_meal_restriction_id", using: :btree
    t.index ["tenant_id"], name: "index_old_enrolments_on_tenant_id", using: :btree
  end

  create_table "operations", force: :cascade do |t|
    t.string   "name"
    t.integer  "manpower"
    t.time     "time"
    t.float    "process_cost"
    t.integer  "unit_of_measurement_id"
    t.float    "quantity"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["unit_of_measurement_id"], name: "index_operations_on_unit_of_measurement_id", using: :btree
  end

  create_table "parent_orders", force: :cascade do |t|
    t.string   "identity_number"
    t.float    "amount"
    t.integer  "tenant_id"
    t.string   "status"
    t.date     "date"
    t.string   "meal_time"
    t.string   "flag"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "food_category_id"
    t.integer  "meal_restriction_id"
    t.integer  "menu_customer_id"
    t.datetime "deleted_at"
    t.string   "stud_type"
    t.index ["deleted_at"], name: "index_parent_orders_on_deleted_at", using: :btree
    t.index ["food_category_id"], name: "index_parent_orders_on_food_category_id", using: :btree
    t.index ["meal_restriction_id"], name: "index_parent_orders_on_meal_restriction_id", using: :btree
    t.index ["menu_customer_id"], name: "index_parent_orders_on_menu_customer_id", using: :btree
    t.index ["tenant_id"], name: "index_parent_orders_on_tenant_id", using: :btree
  end

  create_table "plans", force: :cascade do |t|
    t.string   "name"
    t.datetime "date"
    t.string   "plan_for"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.boolean  "plan_duplicate"
    t.integer  "source"
  end

  create_table "point_of_sales", force: :cascade do |t|
    t.date     "date"
    t.integer  "tenant_id"
    t.string   "meal_time"
    t.integer  "quantity"
    t.integer  "actual_qty"
    t.integer  "food_category_id"
    t.string   "time"
    t.string   "comment"
    t.integer  "flag"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "meal_restriction_id"
    t.datetime "deleted_at"
    t.string   "stud_type"
    t.index ["deleted_at"], name: "index_point_of_sales_on_deleted_at", using: :btree
    t.index ["food_category_id"], name: "index_point_of_sales_on_food_category_id", using: :btree
    t.index ["meal_restriction_id"], name: "index_point_of_sales_on_meal_restriction_id", using: :btree
    t.index ["tenant_id"], name: "index_point_of_sales_on_tenant_id", using: :btree
  end

  create_table "production_categories", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "description"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_production_categories_on_deleted_at", using: :btree
    t.index ["name"], name: "index_production_categories_on_name", unique: true, using: :btree
  end

  create_table "production_item_images", force: :cascade do |t|
    t.integer  "production_item_id"
    t.string   "image"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_production_item_images_on_deleted_at", using: :btree
    t.index ["production_item_id"], name: "index_production_item_images_on_production_item_id", using: :btree
  end

  create_table "production_items", force: :cascade do |t|
    t.string   "name",                                null: false
    t.integer  "production_category_id"
    t.decimal  "cost"
    t.integer  "allergy",                default: [],              array: true
    t.float    "quantity"
    t.integer  "unit_of_measurement_id"
    t.integer  "category",               default: [],              array: true
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "created_by"
    t.integer  "updated_by"
    t.string   "item_code"
    t.integer  "item_subcategory_id"
    t.integer  "food_category_id"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_production_items_on_deleted_at", using: :btree
    t.index ["food_category_id"], name: "index_production_items_on_food_category_id", using: :btree
    t.index ["item_subcategory_id"], name: "index_production_items_on_item_subcategory_id", using: :btree
    t.index ["production_category_id"], name: "index_production_items_on_production_category_id", using: :btree
    t.index ["unit_of_measurement_id"], name: "index_production_items_on_unit_of_measurement_id", using: :btree
  end

  create_table "questions", force: :cascade do |t|
    t.string   "question"
    t.string   "category"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_questions_on_deleted_at", using: :btree
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "site_category_id"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_roles_on_deleted_at", using: :btree
    t.index ["name"], name: "index_roles_on_name", unique: true, using: :btree
    t.index ["site_category_id"], name: "index_roles_on_site_category_id", using: :btree
  end

  create_table "site_categories", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "description"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_site_categories_on_deleted_at", using: :btree
    t.index ["name"], name: "index_site_categories_on_name", unique: true, using: :btree
  end

  create_table "software_setups", force: :cascade do |t|
    t.boolean  "software_privileges"
    t.integer  "user_id"
    t.boolean  "attendance"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_software_setups_on_deleted_at", using: :btree
    t.index ["user_id"], name: "index_software_setups_on_user_id", using: :btree
  end

  create_table "standards", force: :cascade do |t|
    t.string   "standard"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "tenant_id"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_standards_on_deleted_at", using: :btree
    t.index ["tenant_id"], name: "index_standards_on_tenant_id", using: :btree
  end

  create_table "stock_ins", force: :cascade do |t|
    t.integer  "ingredient_id"
    t.float    "quantity"
    t.integer  "unit_of_measurement_id"
    t.string   "purchase_from"
    t.string   "purchase_by"
    t.date     "date"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["ingredient_id"], name: "index_stock_ins_on_ingredient_id", using: :btree
    t.index ["unit_of_measurement_id"], name: "index_stock_ins_on_unit_of_measurement_id", using: :btree
  end

  create_table "stock_outs", force: :cascade do |t|
    t.integer  "ingredient_id"
    t.float    "quantity"
    t.integer  "unit_of_measurement_id"
    t.string   "taken_by"
    t.string   "purpose"
    t.date     "date"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["ingredient_id"], name: "index_stock_outs_on_ingredient_id", using: :btree
    t.index ["unit_of_measurement_id"], name: "index_stock_outs_on_unit_of_measurement_id", using: :btree
  end

  create_table "student_feedbacks", force: :cascade do |t|
    t.integer  "tenant_id"
    t.integer  "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date     "date"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_student_feedbacks_on_deleted_at", using: :btree
    t.index ["tenant_id"], name: "index_student_feedbacks_on_tenant_id", using: :btree
  end

  create_table "sub_plans", force: :cascade do |t|
    t.string   "name"
    t.integer  "plan_id"
    t.integer  "site_category_id"
    t.integer  "food_category_id"
    t.string   "stud_type"
    t.string   "spread_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "meal_time"
    t.index ["food_category_id"], name: "index_sub_plans_on_food_category_id", using: :btree
    t.index ["plan_id"], name: "index_sub_plans_on_plan_id", using: :btree
    t.index ["site_category_id"], name: "index_sub_plans_on_site_category_id", using: :btree
  end

  create_table "tags", force: :cascade do |t|
    t.integer  "rfid"
    t.string   "warrenty"
    t.string   "auto_id"
    t.integer  "utensil_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "status"
    t.index ["utensil_id"], name: "index_tags_on_utensil_id", using: :btree
  end

  create_table "tenant_details", force: :cascade do |t|
    t.string   "meal_plan"
    t.string   "meal_time"
    t.string   "order"
    t.integer  "quantity"
    t.integer  "actval_quantity"
    t.integer  "tenant_id"
    t.float    "cost"
    t.integer  "food_category_id"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "meal_restriction_id"
    t.datetime "deleted_at"
    t.string   "stud_type"
    t.string   "delivery_time"
    t.string   "dispatch_time"
    t.string   "spread_type"
    t.index ["deleted_at"], name: "index_tenant_details_on_deleted_at", using: :btree
    t.index ["food_category_id"], name: "index_tenant_details_on_food_category_id", using: :btree
    t.index ["meal_restriction_id"], name: "index_tenant_details_on_meal_restriction_id", using: :btree
    t.index ["tenant_id"], name: "index_tenant_details_on_tenant_id", using: :btree
  end

  create_table "tenants", force: :cascade do |t|
    t.string   "name",                            null: false
    t.string   "description"
    t.string   "email",                           null: false
    t.string   "sex"
    t.float    "latitude",                        null: false
    t.float    "longitude",                       null: false
    t.date     "from_date"
    t.date     "to_date"
    t.string   "contact_person1",                 null: false
    t.string   "contact_person2"
    t.string   "phone1",                          null: false
    t.string   "phone2"
    t.string   "address",                         null: false
    t.integer  "exclude"
    t.boolean  "active",           default: true
    t.integer  "image_id"
    t.integer  "kitchen_id"
    t.integer  "site_category_id"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "meal"
    t.datetime "deleted_at"
    t.string   "feedback_code"
    t.string   "color_code"
    t.string   "gst_number"
    t.integer  "customer_id"
    t.index ["deleted_at"], name: "index_tenants_on_deleted_at", using: :btree
    t.index ["image_id"], name: "index_tenants_on_image_id", using: :btree
    t.index ["kitchen_id"], name: "index_tenants_on_kitchen_id", using: :btree
    t.index ["name"], name: "index_tenants_on_name", unique: true, using: :btree
    t.index ["site_category_id"], name: "index_tenants_on_site_category_id", using: :btree
  end

  create_table "test1s", force: :cascade do |t|
    t.string   "hh"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trip_assignments", force: :cascade do |t|
    t.string   "date"
    t.string   "order_id"
    t.string   "meal_time"
    t.string   "trip_name"
    t.string   "vehicle"
    t.string   "vehicle_name"
    t.string   "reg_no"
    t.string   "driver"
    t.string   "source"
    t.string   "destination"
    t.integer  "count"
    t.string   "status"
    t.string   "pickup_time"
    t.string   "delivery_time"
    t.json     "job_id"
    t.integer  "pickup_count"
    t.integer  "delivery_count"
    t.string   "total_km"
    t.integer  "trip_detail_id"
    t.string   "actual_pickup"
    t.string   "actual_delivery"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "trip_details", force: :cascade do |t|
    t.string   "source"
    t.string   "destination"
    t.string   "vehicle_type"
    t.integer  "distance"
    t.float    "rate"
    t.string   "waiting_time"
    t.float    "waiting_charge"
    t.float    "serving_charging"
    t.string   "order_id"
    t.string   "job_id"
    t.string   "trip_type"
    t.string   "status"
    t.integer  "trip_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["trip_id"], name: "index_trip_details_on_trip_id", using: :btree
  end

  create_table "trip_plans", force: :cascade do |t|
    t.integer  "driver_id"
    t.integer  "trip_id"
    t.datetime "date"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_trip_plans_on_category_id", using: :btree
    t.index ["driver_id"], name: "index_trip_plans_on_driver_id", using: :btree
    t.index ["trip_id"], name: "index_trip_plans_on_trip_id", using: :btree
  end

  create_table "trip_schedules", force: :cascade do |t|
    t.date     "date"
    t.string   "trip_name"
    t.string   "driver_name"
    t.string   "reporting_time"
    t.string   "meal_time"
    t.string   "status"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "trips", force: :cascade do |t|
    t.string   "trip_name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.float    "trip_cost"
    t.integer  "trip_distance"
    t.string   "report_time"
  end

  create_table "unit_of_measurements", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "description"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_unit_of_measurements_on_deleted_at", using: :btree
    t.index ["name"], name: "index_unit_of_measurements_on_name", unique: true, using: :btree
  end

  create_table "user_feedbacks", force: :cascade do |t|
    t.integer  "tenant_id"
    t.string   "rating"
    t.string   "comment"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.datetime "date"
    t.string   "menu"
    t.string   "quantity"
    t.integer  "category_id"
    t.integer  "menu_cycle_id"
    t.index ["category_id"], name: "index_user_feedbacks_on_category_id", using: :btree
    t.index ["menu_cycle_id"], name: "index_user_feedbacks_on_menu_cycle_id", using: :btree
    t.index ["tenant_id"], name: "index_user_feedbacks_on_tenant_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.integer  "tenant_id"
    t.string   "name"
    t.string   "user_name"
    t.string   "password_digest"
    t.string   "email"
    t.string   "mobile_number"
    t.text     "address"
    t.string   "auth_token"
    t.integer  "role_id"
    t.integer  "kitchen_id"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_users_on_deleted_at", using: :btree
    t.index ["kitchen_id"], name: "index_users_on_kitchen_id", using: :btree
    t.index ["role_id"], name: "index_users_on_role_id", using: :btree
    t.index ["tenant_id"], name: "index_users_on_tenant_id", using: :btree
    t.index ["user_name"], name: "index_users_on_user_name", unique: true, using: :btree
  end

  create_table "utensilnames", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "utensils", force: :cascade do |t|
    t.integer  "status",                  default: 1,    null: false
    t.boolean  "available_status",        default: true
    t.integer  "kitchen_id"
    t.string   "tracking"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "description"
    t.decimal  "price"
    t.decimal  "tare_weight"
    t.decimal  "lid_weight"
    t.datetime "deleted_at"
    t.integer  "count"
    t.string   "upload_status"
    t.integer  "count_dummy"
    t.string   "asset_type"
    t.string   "depriciation_category"
    t.datetime "purchase_date"
    t.string   "vendor"
    t.integer  "volume"
    t.datetime "amc"
    t.float    "depriciation_percentage"
    t.datetime "warranty"
    t.integer  "utensilname_id"
    t.integer  "department_id"
    t.index ["deleted_at"], name: "index_utensils_on_deleted_at", using: :btree
    t.index ["department_id"], name: "index_utensils_on_department_id", using: :btree
    t.index ["kitchen_id"], name: "index_utensils_on_kitchen_id", using: :btree
    t.index ["utensilname_id"], name: "index_utensils_on_utensilname_id", using: :btree
  end

  create_table "utensils_categories", force: :cascade do |t|
    t.string   "utensils_category_name", null: false
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "unit_of_measurement_id"
    t.datetime "deleted_at"
    t.string   "upload_status"
    t.string   "asset_type"
    t.index ["deleted_at"], name: "index_utensils_categories_on_deleted_at", using: :btree
    t.index ["unit_of_measurement_id"], name: "index_utensils_categories_on_unit_of_measurement_id", using: :btree
    t.index ["utensils_category_name"], name: "index_utensils_categories_on_utensils_category_name", unique: true, using: :btree
  end

  create_table "vehicle_types", force: :cascade do |t|
    t.string   "vehicle_type_name"
    t.string   "type_details"
    t.integer  "transport_type"
    t.integer  "status"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "vehicles", force: :cascade do |t|
    t.string   "reg_no"
    t.integer  "vehicle_type_id"
    t.string   "vehicle_name"
    t.string   "vehicle_owner"
    t.string   "vehicle_contact_no"
    t.boolean  "gps_status",         default: false
    t.string   "gps_id"
    t.integer  "status"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.index ["vehicle_type_id"], name: "index_vehicles_on_vehicle_type_id", using: :btree
  end

  create_table "vessel_dispatches", force: :cascade do |t|
    t.datetime "date"
    t.integer  "category_id"
    t.hstore   "menuitem"
    t.integer  "utensil_id"
    t.integer  "tag_id"
    t.integer  "tenant_detail_id"
    t.integer  "count"
    t.float    "wastage"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "status"
    t.boolean  "utensil_received", default: false
    t.index ["category_id"], name: "index_vessel_dispatches_on_category_id", using: :btree
    t.index ["tag_id"], name: "index_vessel_dispatches_on_tag_id", using: :btree
    t.index ["tenant_detail_id"], name: "index_vessel_dispatches_on_tenant_detail_id", using: :btree
    t.index ["utensil_id"], name: "index_vessel_dispatches_on_utensil_id", using: :btree
  end

  create_table "vesselplanners", force: :cascade do |t|
    t.string   "menuitem"
    t.string   "date"
    t.string   "datetime"
    t.integer  "utensils_category_id"
    t.integer  "utensil_id"
    t.integer  "tenant_detail_id"
    t.integer  "countdummy"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "tag_id"
    t.index ["tag_id"], name: "index_vesselplanners_on_tag_id", using: :btree
    t.index ["tenant_detail_id"], name: "index_vesselplanners_on_tenant_detail_id", using: :btree
    t.index ["utensil_id"], name: "index_vesselplanners_on_utensil_id", using: :btree
    t.index ["utensils_category_id"], name: "index_vesselplanners_on_utensils_category_id", using: :btree
  end

  create_table "wastages", force: :cascade do |t|
    t.date     "date"
    t.string   "meal_time"
    t.integer  "tenant_id"
    t.float    "wastage_quantity"
    t.integer  "unit_of_measurement_id"
    t.float    "total_qty"
    t.integer  "image_id"
    t.string   "remark"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_wastages_on_deleted_at", using: :btree
    t.index ["image_id"], name: "index_wastages_on_image_id", using: :btree
    t.index ["tenant_id"], name: "index_wastages_on_tenant_id", using: :btree
    t.index ["unit_of_measurement_id"], name: "index_wastages_on_unit_of_measurement_id", using: :btree
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "tenants"
  add_foreign_key "assetstatuses", "kitchens"
  add_foreign_key "assetstatuses", "tags"
  add_foreign_key "assetstatuses", "utensilnames"
  add_foreign_key "attendances", "enrolments"
  add_foreign_key "attendances", "food_categories"
  add_foreign_key "attendances", "menu_customers"
  add_foreign_key "attendances", "normalmenu_sites"
  add_foreign_key "attendances", "tenants"
  add_foreign_key "audit_feedback_questions", "audit_feedback_categories"
  add_foreign_key "audit_feedback_reports", "audit_feedback_categories"
  add_foreign_key "audit_feedback_reports", "audit_feedback_questions"
  add_foreign_key "audit_feedback_reports", "tenants"
  add_foreign_key "auditreviews", "tenants"
  add_foreign_key "client_spread_types", "site_categories"
  add_foreign_key "client_type_categories", "client_categories"
  add_foreign_key "client_type_categories", "site_categories"
  add_foreign_key "comments", "tenants"
  add_foreign_key "customer_view_controls", "tenants"
  add_foreign_key "dc_vesseldispatch_mappings", "delivery_challans"
  add_foreign_key "dc_vesseldispatch_mappings", "vessel_dispatches"
  add_foreign_key "deliveries", "delivery_histories"
  add_foreign_key "deliveries", "dispatches"
  add_foreign_key "deliveries", "tenants"
  add_foreign_key "delivery_histories", "categories"
  add_foreign_key "delivery_histories", "menu_customers"
  add_foreign_key "delivery_histories", "tenants"
  add_foreign_key "dispatch_utensils_mappings", "dispatches"
  add_foreign_key "dispatch_utensils_mappings", "tenants"
  add_foreign_key "dispatch_utensils_mappings", "utensils"
  add_foreign_key "dispatches", "menu_production_items"
  add_foreign_key "dispatches", "tenants"
  add_foreign_key "dispatches", "unit_of_measurements"
  add_foreign_key "dispatches", "utensils"
  add_foreign_key "enrolments", "food_categories"
  add_foreign_key "enrolments", "meal_restrictions"
  add_foreign_key "enrolments", "tenants"
  add_foreign_key "feedbacks", "tenants"
  add_foreign_key "food_groups", "food_categories"
  add_foreign_key "food_groups", "images"
  add_foreign_key "food_returns", "menu_production_items"
  add_foreign_key "food_returns", "tenants"
  add_foreign_key "foodmenus", "tenants"
  add_foreign_key "ingredients", "ingredient_categories"
  add_foreign_key "inventory_logs", "ingredients"
  add_foreign_key "inventory_logs", "stock_ins"
  add_foreign_key "inventory_logs", "stock_outs"
  add_foreign_key "inventory_logs", "unit_of_measurements"
  add_foreign_key "item_categories", "categories"
  add_foreign_key "item_meal_courses", "meal_courses"
  add_foreign_key "item_meal_courses", "production_items"
  add_foreign_key "item_meal_restrictions", "meal_restrictions"
  add_foreign_key "item_meal_restrictions", "production_items"
  add_foreign_key "kitchen_users", "kitchens"
  add_foreign_key "kitchen_users", "roles"
  add_foreign_key "mealcounts", "food_categories"
  add_foreign_key "mealcounts", "tenants"
  add_foreign_key "menu_customer_dispatches", "dispatches"
  add_foreign_key "menu_customer_dispatches", "menu_customers"
  add_foreign_key "menu_customers", "categories"
  add_foreign_key "menu_customers", "meal_restrictions"
  add_foreign_key "menu_customers", "menu_masters"
  add_foreign_key "menu_customers", "tenants"
  add_foreign_key "menu_cycles", "categories"
  add_foreign_key "menu_cycles", "sub_plans"
  add_foreign_key "menu_cycles", "tenant_details"
  add_foreign_key "menu_masters", "alleries"
  add_foreign_key "menu_masters", "categories"
  add_foreign_key "menu_masters", "food_categories"
  add_foreign_key "menu_masters", "meal_restrictions"
  add_foreign_key "menu_planners", "categories"
  add_foreign_key "menu_planners", "sub_plans"
  add_foreign_key "menu_planners", "tenant_details"
  add_foreign_key "menu_production_items", "meal_courses"
  add_foreign_key "menu_production_items", "menu_masters"
  add_foreign_key "menu_production_items", "production_items"
  add_foreign_key "menureviews", "foodmenus"
  add_foreign_key "menureviews", "menu_production_items"
  add_foreign_key "menureviews", "normal_menus"
  add_foreign_key "normal_menus", "food_categories"
  add_foreign_key "normal_menus", "normalmenu_sites"
  add_foreign_key "normal_menus", "nutritions"
  add_foreign_key "normalmenu_sites", "tenants"
  add_foreign_key "nutritions", "production_items"
  add_foreign_key "old_enrolments", "food_categories"
  add_foreign_key "old_enrolments", "meal_restrictions"
  add_foreign_key "old_enrolments", "tenants"
  add_foreign_key "operations", "unit_of_measurements"
  add_foreign_key "parent_orders", "food_categories"
  add_foreign_key "parent_orders", "meal_restrictions"
  add_foreign_key "parent_orders", "menu_customers"
  add_foreign_key "parent_orders", "tenants"
  add_foreign_key "point_of_sales", "food_categories"
  add_foreign_key "point_of_sales", "meal_restrictions"
  add_foreign_key "point_of_sales", "tenants"
  add_foreign_key "production_item_images", "production_items"
  add_foreign_key "production_items", "food_categories"
  add_foreign_key "production_items", "production_categories"
  add_foreign_key "production_items", "unit_of_measurements"
  add_foreign_key "roles", "site_categories"
  add_foreign_key "software_setups", "users"
  add_foreign_key "standards", "tenants"
  add_foreign_key "stock_ins", "ingredients"
  add_foreign_key "stock_ins", "unit_of_measurements"
  add_foreign_key "stock_outs", "ingredients"
  add_foreign_key "stock_outs", "unit_of_measurements"
  add_foreign_key "student_feedbacks", "tenants"
  add_foreign_key "sub_plans", "food_categories"
  add_foreign_key "sub_plans", "plans"
  add_foreign_key "sub_plans", "site_categories"
  add_foreign_key "tags", "utensils"
  add_foreign_key "tenant_details", "food_categories"
  add_foreign_key "tenant_details", "meal_restrictions"
  add_foreign_key "tenant_details", "tenants"
  add_foreign_key "tenants", "images"
  add_foreign_key "tenants", "kitchens"
  add_foreign_key "tenants", "site_categories"
  add_foreign_key "trip_details", "trips"
  add_foreign_key "trip_plans", "categories"
  add_foreign_key "trip_plans", "drivers"
  add_foreign_key "trip_plans", "trips"
  add_foreign_key "user_feedbacks", "categories"
  add_foreign_key "user_feedbacks", "menu_cycles"
  add_foreign_key "user_feedbacks", "tenants"
  add_foreign_key "users", "kitchens"
  add_foreign_key "users", "roles"
  add_foreign_key "users", "tenants"
  add_foreign_key "utensils", "departments"
  add_foreign_key "utensils", "kitchens"
  add_foreign_key "utensils", "utensilnames"
  add_foreign_key "utensils_categories", "unit_of_measurements"
  add_foreign_key "vehicles", "vehicle_types"
  add_foreign_key "vessel_dispatches", "categories"
  add_foreign_key "vessel_dispatches", "tags"
  add_foreign_key "vessel_dispatches", "tenant_details"
  add_foreign_key "vessel_dispatches", "utensils"
  add_foreign_key "vesselplanners", "tags"
  add_foreign_key "vesselplanners", "tenant_details"
  add_foreign_key "vesselplanners", "utensils"
  add_foreign_key "vesselplanners", "utensils_categories"
  add_foreign_key "wastages", "tenants"
  add_foreign_key "wastages", "unit_of_measurements"
end
