class TenantDetail < ApplicationRecord

  belongs_to :tenant#, :inverse_of => :tenant_details
  belongs_to :food_category#, optional: true
  belongs_to :meal_restriction, optional: true
  validates :quantity, :meal_time, presence: true
  has_many :menu_planners
  has_many :menu_cycles
  acts_as_paranoid
=begin

  def self.enrolledcount(normalmenu_data)
  	 data = where(meal_time: normalmenu_data.meal_time, tenant_id:normalmenu_data.tenant_id)
  end

  def self.enrolledcount(menu_data)

  	 data = where(meal_time: menu_data.meal_time, tenant_id:menu_data.tenant_id)

    child_veg_norms = data.where(meal_plan: "Normal-Menu", meal_type: "Veg", age_type: "Child", order: "Order").map{|qty|qty.quantity.to_i}.sum  	 
	teens_veg_norms = data.where(meal_plan: "Normal-Menu", meal_type: "Veg", age_type: "Teens", order: "Order").map{|qty|qty.quantity.to_i}.sum  	 
	adult_veg_norms = data.where(meal_plan: "Normal-Menu", meal_type: "Veg", age_type: "Adult", order: "Order").map{|qty|qty.quantity.to_i}.sum  	    

	child_non_veg_norms = data.where(meal_plan: "Normal-Menu", meal_type: "Non-Veg", age_type: "Child", order: "Order").map{|qty|qty.quantity.to_i}.sum  	 
	teens_non_veg_norms = data.where(meal_plan: "Normal-Menu", meal_type: "Non-Veg", age_type: "Teens", order: "Order").map{|qty|qty.quantity.to_i}.sum  	 
	adult_non_veg_norms = data.where(meal_plan: "Normal-Menu", meal_type: "Non-Veg", age_type: "Adult", order: "Order").map{|qty|qty.quantity.to_i}.sum  	    

	child_veg_opt = data.where(meal_plan: "Optional-Menu", meal_type: "Veg", age_type: "Child", order: "Order").map{|qty|qty.quantity.to_i}.sum  	 
	teens_veg_opt = data.where(meal_plan: "Optional-Menu", meal_type: "Veg", age_type: "Teens", order: "Order").map{|qty|qty.quantity.to_i}.sum  	 
	adult_veg_opt = data.where(meal_plan: "Optional-Menu", meal_type: "Veg", age_type: "Adult", order: "Order").map{|qty|qty.quantity.to_i}.sum  	    

	child_non_veg_opt = data.where(meal_plan: "Optional-Menu", meal_type: "Non-Veg", age_type: "Child", order: "Order").map{|qty|qty.quantity.to_i}.sum  	 
	teens_non_veg_opt = data.where(meal_plan: "Optional-Menu", meal_type: "Non-Veg", age_type: "Teens", order: "Order").map{|qty|qty.quantity.to_i}.sum  	 
	adult_non_veg_opt = data.where(meal_plan: "Optional-Menu", meal_type: "Non-Veg", age_type: "Adult", order: "Order").map{|qty|qty.quantity.to_i}.sum  

	result = {veg_normal_child: child_veg_norms ,non_veg_normal_child: child_non_veg_norms,veg_normal_teens: teens_veg_norms,non_veg_normal_teens: teens_non_veg_norms, veg_normal_adult: adult_veg_norms,non_veg_normal_adult: adult_non_veg_norms ,veg_optional_child: child_veg_opt ,non_veg_optional_child: child_non_veg_opt ,veg_optional_teens: teens_veg_opt ,non_veg_optional_teens: teens_non_veg_opt,veg_optional_adult: adult_veg_opt,non_veg_optional_adult: adult_non_veg_opt}

	return result

  end

  def self.posenrolledcount(menu_data1)

  	pos_data = PointOfSale.where(date:menu_data1.date, meal_time: menu_data1.meal_time, tenant_id:menu_data1.tenant_id)

  	unrnroll_data = where(meal_time: menu_data1.meal_time, tenant_id:menu_data1.tenant_id)
  	
  		child_veg_norms = unrnroll_data.where(meal_plan: "Normal-Menu", meal_type: "Veg", age_type: "Child", order: "Un-Order").map{|qty|qty.quantity.to_i}.sum  	 
		
		teens_veg_norms = unrnroll_data.where(meal_plan: "Normal-Menu", meal_type: "Veg", age_type: "Teens", order: "Un-Order").map{|qty|qty.quantity.to_i}.sum  	 
		
		adult_veg_norms = unrnroll_data.where(meal_plan: "Normal-Menu", meal_type: "Veg", age_type: "Adult", order: "Un-Order").map{|qty|qty.quantity.to_i}.sum 

		pos_veg_norms = pos_data.where(meal_type: "Normal_Menu", meal_category: "Veg").map{|qty|qty.quantity.to_i}.sum

		total_norm_veg_pos = child_veg_norms+teens_veg_norms+adult_veg_norms+pos_veg_norms


	
		child_non_veg_norms = unrnroll_data.where(meal_plan: "Normal-Menu", meal_type: "Non-Veg", age_type: "Child", order: "Un-Order").map{|qty|qty.quantity.to_i}.sum  	 
	
		teens_non_veg_norms = unrnroll_data.where(meal_plan: "Normal-Menu", meal_type: "Non-Veg", age_type: "Teens", order: "Un-Order").map{|qty|qty.quantity.to_i}.sum  	 
	
		adult_non_veg_norms = unrnroll_data.where(meal_plan: "Normal-Menu", meal_type: "Non-Veg", age_type: "Adult", order: "Un-Order").map{|qty|qty.quantity.to_i}.sum  

		pos_non_veg_norms = pos_data.where(meal_type: "Normal_Menu", meal_category: "Non-Veg").map{|qty|qty.quantity.to_i}.sum  	 

		total_norm_non_veg_pos = child_non_veg_norms+teens_non_veg_norms+adult_non_veg_norms+pos_non_veg_norms




		child_veg_opt = unrnroll_data.where(meal_plan: "Optional-Menu", meal_type: "Veg", age_type: "Child", order: "Un-Order").map{|qty|qty.quantity.to_i}.sum  	 
	
		teens_veg_opt = unrnroll_data.where(meal_plan: "Optional-Menu", meal_type: "Veg", age_type: "Teens", order: "Un-Order").map{|qty|qty.quantity.to_i}.sum  	 
	
		adult_veg_opt = unrnroll_data.where(meal_plan: "Optional-Menu", meal_type: "Veg", age_type: "Adult", order: "Un-Order").map{|qty|qty.quantity.to_i}.sum  	
		
		pos_veg_opt = pos_data.where(meal_type: "Optional_Menu", meal_category: "Veg").map{|qty|qty.quantity.to_i}.sum  	 

		total_option_veg_pos = child_veg_opt+teens_veg_opt+adult_veg_opt+pos_veg_opt



		child_non_veg_opt = unrnroll_data.where(meal_plan: "Optional-Menu", meal_type: "Non-Veg", age_type: "Child", order: "Un-Order").map{|qty|qty.quantity.to_i}.sum  	 
	
		teens_non_veg_opt = unrnroll_data.where(meal_plan: "Optional-Menu", meal_type: "Non-Veg", age_type: "Teens", order: "Un-Order").map{|qty|qty.quantity.to_i}.sum  	 
	
		adult_non_veg_opt = unrnroll_data.where(meal_plan: "Optional-Menu", meal_type: "Non-Veg", age_type: "Adult", order: "Un-Order").map{|qty|qty.quantity.to_i}.sum 

		pos_non_veg_opt = pos_data.where(meal_type: "Optional_Menu", meal_category: "Non-Veg").map{|qty|qty.quantity.to_i}.sum 

		total_option_non_veg_pos = child_non_veg_opt+teens_non_veg_opt+adult_non_veg_opt+pos_non_veg_opt
 

		pos_result = {veg_norms: total_norm_veg_pos, non_veg_norms: total_norm_non_veg_pos, veg_option: total_option_veg_pos, non_veg_option: total_option_non_veg_pos} 

	return pos_result	 
	
  end

  def self.individualenrolleddata(menu_data2)

  	parent_data = ParentOrder.where(meal_time: menu_data2.meal_time, tenant_id:menu_data2.tenant_id,order_date:menu_data2.date)

  		parent_norms = parent_data.where(meal_plan: "Normal_Menu").count
	

		parent_option = parent_data.where(meal_plan: "Optional_Menu").count  	 

		parent_result = {normal: parent_norms, optional: parent_option} 

	return parent_result
	
  end

=end

end
