class Kitchen < ApplicationRecord
    has_many   :tenants,  :dependent => :destroy
	has_one    :user,  :dependent => :destroy
	has_one    :kitchen_user,  :dependent => :destroy
	has_many :utensils, dependent: :destroy
	validates :name, presence: true
	validates :responsible_person, presence: true
    validates :address, presence: true
    acts_as_paranoid

     def self.chefscreen
    	chef_data=[]
    	["Breakfast","Lunch","Dinner"].map do |meal|
	      normalmenu_site_id=NormalmenuSite.where(:date=>Date.tomorrow,:delivery_status=>"Menu Planned",:meal_time=>meal).ids
		  if normalmenu_site_id.present?
		    #tenant_id=NormalmenuSite.where(:date=>Date.today,:delivery_status=>"Menu Planned",:meal_time=>meal).pluck(:tenant_id)
		    nutrition_id=NormalMenu.where(:normalmenu_site_id=>normalmenu_site_id).pluck(:nutrition_id).uniq
	        if nutrition_id.present?
	           nutrition_data=[]
	          nutrition_id.map do |i|
	          	nutrition=Nutrition.find(i)
	          	#nor_menu_site_id = NormalMenu.where(:nutrition_id=>i).pluck(:normalmenu_site_id).uniq
	          	#tenant_id = NormalmenuSite.where(:id=>nor_menu_site_id).pluck(:tenant_id).uniq
                 #  value=[TenantDetail.where(:meal_time=>meal).where(:tenant_id=>tenant_id).where(:food_category_id=>nutrition.normal_menu.food_category_id).pluck(:quantity),NormalMenu.where(:nutrition_id=>i).pluck(:quantity)]
                 value=NormalMenu.where(:nutrition_id=>i,:normalmenu_site_id=>normalmenu_site_id).pluck(:quantity,:total_members_count)
		      		 nutrition_data<<[nutrition.normal_menu.food_category.name,nutrition.production_item.name,value]
             end
		      chef_data << [meal,nutrition_data]
	        end   
	      end
	    end 
      return chef_data	
   end
end
