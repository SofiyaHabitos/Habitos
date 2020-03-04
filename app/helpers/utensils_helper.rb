module UtensilsHelper

	def status_list
         return [ "Inhouse" ,"Maintainence" , "Resale", "Disposal","Missing"]
	end

	def default_status(utensil)
		return utensil.tracking.present? ? utensil.tracking : "Inhouse"
	end

	def asset_status
		return {'Status' => ["Inhouse", "Maintainence", "Resale", "Disposal", "Missing"],
        'Other Facility' => Kitchen.all.order('name').pluck(:name)}
	end

	def utensil_name(params)

		return Utensilname.where(id: params["id"]).pluck(:name,:id)
	end

end