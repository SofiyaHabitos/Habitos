class ItemSubcategory < ApplicationRecord
 	validates :name, presence: true,uniqueness: { case_sensitive: false}
 	 acts_as_paranoid
 	  require 'rest-client'

 	def self.get_category
 		cat_ids= []
 		response = RestClient::Request.execute(
        method: :get,
    	url: "http://192.168.1.128/webservice/rest/object/id/28?apikey=5408f51963e612c2a9b70b34d4aed39469533cb0f20ee373d81a099750c07da6")
     	data = JSON.parse(response) 

     	data["data"]["elements"].map do |food|
     	food["value"].map{|id| cat_ids << id["id"]}
     	end
		all_category = []
     	cat_ids.map do |cat_id|
     		category= RestClient::Request.execute(
        	method: :get,
    		url: "http://192.168.1.128/webservice/rest/object/id"+"/"+cat_id.to_s+"?apikey=5408f51963e612c2a9b70b34d4aed39469533cb0f20ee373d81a099750c07da6")
     		category_details = JSON.parse(category) 
     		 all_category << category_details["data"]

       	end
        return all_category

 	end
end
