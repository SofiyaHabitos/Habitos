Rails.application.routes.draw do

 
  
  resources :vehicle_types
  post 'vesselplanners/save_pdf'
  
  get 'audit_feedback_categories/audit_report'

  post 'audit_feedback_categories/audit_report'

  get 'feedbacks/feedbackchart'

  post 'feedbacks/feedbackchart'
  
  get 'vesselplanners/save_pdf'

  get 'normalmenu_sites/stores'

  get 'drivers/check_vehicle_register_present'
  
  get 'drivers/check_driver_present'

  get 'drivers/check_driver_email_present'

  get 'sync_utensils' => 'utensils#sync_utensil_available_count'

  get 'utensil_reallocation' => 'vesselplanners#utensil_reallocation'

  get 'trip_details/check_plan_name_present'

  get 'tripplans/index'

  get 'tripplans/new'

  post 'tripplans/new'

  get 'tripplans/edit'

  get 'tripplans/vessel_delivery'

  get 'tripplans/trip_plan'

  get 'tripplans/tookan_detail'

  post 'tripplans/tookan_detail'

  resources :trip_details

  resources :drivers
  post 'drivers/create'
  post  'drivers/add_agent'
  post 'drivers/driver_start'
  post 'drivers/driver_delivered'
  root :to => "kitchen_users#login"

   #get 'assigned_menu_pdf' => 'tenants#assigned_menu_pdf'
  patch 'tripdetail_update' => 'trip_details#tripdetail_update'
   
  get 'dynamic_trip_row' => 'trips#dynamic_trip_row'

  get 'status_register_edit' => 'vesselplanners#status_register_edit'

  get 'cooksheet_item_edit' => 'tenants#cooksheet_item_edit'

  get 'client_totalqty' => 'tenants#client_totalqty'
  post 'update_total_qty' => 'menu_customers#update_total_qty'

  get 'dynamic_client_menu' => 'tenants#dynamic_client_menu'
  post 'dynamic_client_menu' => 'tenants#dynamic_client_menu'

  get 'assigned_menu' => 'tenants#assigned_menu'
  post 'assigned_menu' => 'tenants#assigned_menu'

  get 'mail_assigned_menu'=>'tenants#mail_assigned_menu'

  get 'download_vessel_pdf' => 'vesselplanners#download_vessel_pdf'
  
  get 'vesselplanners/update_status'

  post 'vesselplanners/update_status'

  get 'vesselplanners/status'
  
  post 'vesselplanners/status'

  get 'tenants/check_clientname_present'

  get 'software_setups/software_delete'
  get 'utensilnames/check_utensilname_present'
  get 'utensilnames/check_utensil_present'
  get 'client_categories/check_name_present'
  get 'mail_cooksheet' => "menu_customers#mail_cooksheet"
  post 'mail_cooksheet' => "menu_customers#mail_cooksheet"
  #post 'menu_customers/customer_filter'
  get 'utensils/category' 
  post 'utensils/category'

  get 'vesselplanners/dispatched'
  post 'vesselplanners/dispatched' 

  get 'vesselplanners/wasted'
  post 'vesselplanners/wasted'

  get 'vesselplanners/dropdown1'

  get 'vesselplanners/vessel_dispatch'
  post 'vesselplanners/vessel_dispatch'

  get 'vesselplanners/vessel_wastage'
  post 'vesselplanners/vessel_wastage'

  post 'vesselplanners/vessel'
  get 'vesselplanners/vessel'

  get 'vesselplanners/new1'
  post 'vesselplanners/new1'

  post 'vesselplanners/new'
  get 'vesselplanners/new'

  get 'vesselplanners/dropdown'
  get 'vesselplanners/index1'
  post 'vesselplanners/index1'

  get 'normalmenu_sites/dropdown'

  get 'menu_customers/dropdown'


  post 'menu_customers/cook_edit'

  get 'menu_customers/cook_sheet_edit'
  
  post 'menu_customers/cook_sheet_edit'
  
  get 'normalmenu_sites/menu_cycle_assign'

  get 'normalmenu_sites/new_menu_planner'


  get 'normalmenu_sites/menu_cycle'

  get 'tripplans/trip_show'
 
  post 'tripplans/trip_show'

  post 'feedback_report' => 'feedbacks#feedback_report'

  get 'utensils/fetch_utensil_category'
  post 'audit_report' => 'auditreviews#audit_report'  

  get 'tenants/user_feedback'

  post 'menu_masters/menumaster_report'

  post 'menu_customers/csv_sheet'

  get 'daily_cook_sheet' => 'menu_customers#daily_cook_sheet'

  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all
  
  post 'feedbacks/feedback_update'
 
  post 'enrolments/enrol_delete_approval'

  post 'enrolments/newenrol_approval'

  get 'enrolments/approval_screen'

  post 'feedbacks/approval_feedback'

  get 'feedbacks/driver_report'
 
  get 'food_returns_report' => 'feedbacks#food_returns_report'

  post 'food_returns_report' => 'feedbacks#food_returns_report'

  get 'delivery_report' => 'dispatches#delivery_report'
  post 'delivery_report' => 'dispatches#delivery_report'

  get 'utensil_report' => 'utensils#utensil_report'
  #post 'utensil_report' => 'utensils#utensil_report'

  get 'customer_report' => 'tenants#customer_report'
  post 'customer_report' => 'tenants#customer_report'  

  get 'enrol_index' => 'enrolments#enrol_index'
  
  get 'attendance_index' => 'enrolments#attendance_index'
  get 'attendance' => 'enrolments#attendance'

  get 'point_of_sales/get_restriction'

  get 'kitchens/check_facilit_present'
  post 'kitchens/check_facilit_present'

  get 'tenant/check_meal_info'
  post 'tenant/check_meal_info'

  get 'point_of_sales/get_data'

  get 'point_of_sales/check_date'
  post 'point_of_sales/check_date'

  get 'meal_courses/check_position'
  post 'meal_courses/check_position'    

  get 'point_of_sales/check_tenant'
  post 'point_of_sales/check_tenant'

  get '/edit_item' => 'production_items#edit_item'
  patch '/update_item' => 'production_items#update_item'

  get 'unit_of_measurements/bck'

  get 'tenants/check_mg_present'
  post 'tenants/check_mg_present'

  get 'normalmenu_sites/menu_assign'

  get 'normalmenu_sites/menuplanner_design'

  get 'normalmenu_sites/menu_planner'

  get 'normalmenu_sites/wastage'
  post 'normalmenu_sites/wastage'

  get "kitchen_users/dynamic_drop"
  #post "kitchen_users/dynamic_drop"

 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get"check_tet/normalmenu_sites"
  post"check_tet/normalmenu_sites"
  get "kitchen_users/login"
  post "kitchen_users/login_validation"
  get 'kitchen_users/logout'
  get "kitchens/index"
  post "kitchens/create"
  get "kitchens/chef"

  get "food_groups/image_pop"
  get "customer_view_controls/billing_pop"
  get "customer_view_controls/nutrition_pop"
  get "customer_view_controls/bill_pop"
  get "/status" =>"normalmenu_sites#order_status"
  post "/status" =>"normalmenu_sites#order_status"
  get "/summaries" =>"normalmenu_sites#summary"
  post "/summaries" =>"normalmenu_sites#summary"
  get "/enrolled" =>"normalmenu_sites#enrolled"
  post "/enrolled" =>"normalmenu_sites#enrolled"
  get "/dispatch_status" =>"normalmenu_sites#dispatch_status"
  post "/dispatch_status" =>"normalmenu_sites#dispatch_status"
  get "/delivery_status" =>"normalmenu_sites#delivery_status"
  post "/delivery_status" =>"normalmenu_sites#delivery_status"

  get "normalmenu_sites/delivery_problem_status"
  post "normalmenu_sites/delivery_problem_status"

  get "/utensil_status" =>"normalmenu_sites#utensil_status"
  post "/utensil_status" =>"normalmenu_sites#utensil_status"
  get "enrolments/enrolment_upload"
  post "enrolments/enrolment_upload"
  get "enrolments/upload_process"
  post "enrolments/upload_process"
  get "normalmenu_sites/dashboard"
  post "normalmenu_sites/dashboard"
  get "normalmenu_sites/summary_edit"
  post "normalmenu_sites/summary_edit"
  get "normalmenu_sites/drop"
  get "normalmenu_sites/dropdown1"

  get "normalmenu_sites/normalmenu_category_add"
  #post "normalmenu_sites/normalmenu_category_add"
  post "normalmenu_sites/normalmenusite_save"
  get "normalmenu_sites/normalmenusite_save"
  get "normalmenu_sites/normalmenu_category_edit"
  #post "normalmenu_sites/normalmenu_category_edit"
  post "normalmenu_sites/normalmenu_category_edit_save"
  get "normalmenu_sites/normalmenu_category_show"
  get "normalmenu_sites/normalmenu_category_delete"
  #post "normalmenu_sites/normalmenu_category_delete"
  get "normalmenu_sites/notreceive_status"

  get "enrolments/individual"

  get "feedbacks/allow_update"
  post "feedbacks/allow_update"

  get 'software_setups/check_username_present'
  post 'software_setups/check_username_present'

  get 'dispatch_utensils_mappings/rec'
  post 'dispatch_utensils_mappings/rec'

  resources :standards
  resources :depriciation_categories
  resources :utensilnames
  resources :client_categories
  resources :item_meal_restrictions
  resources :menu_customers
  resources :departments
  resources :menu_production_items
  resources :menu_masters
  resources :meal_restrictions
  resources :item_meal_courses
  resources :meal_courses
  resources :auditreviews
  resources :feedbacks
  resources :point_of_sales
  resources :kitchens
  resources :customer_view_controls
  resources :parent_orders
  resources :software_setups
  resources :dispatch_utensils_mappings
  resources :utensils_count_mappings
  resources :utensils_categories
  resources :payments
  resources :normalmenu_sites
  resources :operations
  resources :production_items
  resources :production_categories
  resources :item_subcategories
  resources :unit_of_measurements
  resources :nutritions
  resources :software_setup
  resources :food_groups
  resources :food_categories
  resources :item_categories
  resources :categories
  resources :tenants
  resources :audit_feedback_categories
  resources :vehicles

  post  'tenants/create'
  resources :dispatches
  resources :utensils
  resources :site_categories
  resources :enrolments
  resources :page_configurations
  resources :pages
  resources :tenant_details
  resources :users
  resources :kitchen_users
  resources :alleries
  
end
