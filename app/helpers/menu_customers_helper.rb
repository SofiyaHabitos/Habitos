module MenuCustomersHelper
	def over_all_quantity(val,mname)
			total = []
		val.each_with_index do |tt,index|
			
			curr_data = tt.menu_items.find {|x| x["name"] == mname["name"]}
			qty = curr_data.present?  ? curr_data["qty"].to_f : "".to_f
            total << (tt.quantity.to_f * qty).round(3) if tt.quantity.present?
		end

		return total.sum.round(3)
	end
end
