module SiteCategoriesHelper
	def client_category_list
		return ClientCategory.all
	end

	def spread_types
		
    	spread_type_response = RestClient.get("#{$pim_core_service}/pimcore/api/FoodRecepie/SpreadName")
	   	spread_data = JSON.parse(spread_type_response)
	   	response = spread_data["Spread"].map {|spread| [spread["spreadtype"], spread["spreadid"].to_i] }
		return response
	end

	def client_spreads(site_category)
		if site_category.client_spread_types.present?
		spread_ids = site_category.client_spread_types.pluck(:spread_type_id).join(",") if site_category.client_spread_types.present?
    	spread_type_response = RestClient.get("#{$pim_core_service}/pimcore/api/FoodRecepie/SpreadName?id="+spread_ids)
	   	spread_data = JSON.parse(spread_type_response)
	   	response = spread_data["Spread"].map {|spread| spread["spreadtype"] }
	   else
	   	response = []
	   end

		return response
	
	end
end
