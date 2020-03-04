					module NormalmenuSitesHelper
def menudate(data)
	res = data.tenant.normalmenu_sites.where(:meal_time=>data.meal_time).first
	if res.nil?
		return "-"
	else
		return res.date
	end
end
def production_item
	
		data = []
	
		Nutrition.all.map{|kk| data << {id: kk.id, name: "#{kk.production_item.name+'-('+kk.production_item.unit_of_measurement.name}"+')'}}
	
		return data
	
	end

	def value
	
		unless params[:id].nil?
		 	
			{:readonly => true,:class=>"form-control",:required=>"true"}
		
		else

	    	{:readonly => true,:value=>"Meal Planned",:class=>"form-control",:required=>"true"}	

		end
	
	end
end
