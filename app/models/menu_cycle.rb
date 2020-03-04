class MenuCycle < ApplicationRecord
	serialize :menu_items, Array
	  belongs_to :category
  	  belongs_to :sub_plan
      belongs_to :tenant_detail



	def self.daily_cook_sheet(date)
	  @menu = MenuCycle.where(date: date).group_by(&:category_id)
	  data = []
	    @menu.map do |cat_id, menu|
        items, result, menus = [], [], []

	     items_list=[]
			menu.map do |i|
			date = date
			category_name = Category.find(cat_id).category_name
			tenant_name = i.tenant_detail.tenant.name
			stud_type = i.tenant_detail.stud_type

			qty = TenantDetail.find_by(meal_time: category_name,tenant_id: i.tenant_detail.tenant_id,stud_type: i.tenant_detail.stud_type,spread_type: i.tenant_detail.spread_type,food_category_id: i.tenant_detail.food_category_id)
            quan = qty.present? ? qty.quantity : 0 
			    menus  = i.menu_items.map do  |e|
			      [{:item_name=> e["name"],:quantity=> e["qty"].to_f, :total=>quan, :result=>(e["qty"].to_f * quan.to_f )}]
			    end
			    i.menu_items.map do  |e|
				  items_list <<  e["name"]
			    end
				items  << {:meal_time=> category_name,:tenant => tenant_name, :stud =>stud_type,:date => date, :menus => menus }
			end
			c=items.count*2
			@result=[]
			items_list.uniq.map do |i|
			  sub_result=[]
			    c.times do |t|
			     sub_result << "-"
			    end
			   @result<<[i,sub_result].flatten
			end

			items.each_with_index do |value, index|
			value[:menus].map do |sub|
			      @result.each_with_index do |v,l| 
			      	  if v[0]==sub[0][:item_name]
                		  @result[l][index+index+1]=sub[0][:quantity] ;  
                          @result[l][index+index+2]=sub[0][:result].round(2);  
              		   end 
              		   
			      end
			     end
			end
            even_num=@result.map {|i| i.values_at(* i.each_index.select {|i| i.even?})}
	        even_num.map{|i| i.delete("-")}
        	even_num.map{|i| i.shift}
        	total=even_num.map{|i| i.sum.round(2)}
        	@result.each_with_index{|v,i| v.push(total[i])}
        	 data << {"tenant": items, result: @result}

        end
    
	  return data
	end

end
