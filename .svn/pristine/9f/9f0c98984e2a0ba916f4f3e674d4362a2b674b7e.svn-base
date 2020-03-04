class Menureview < ApplicationRecord
  
 # belongs_to :imageupload, optional: true
  belongs_to :foodmenu
  belongs_to :menu_production_item
  acts_as_paranoid

=begin    def self.menureview(params)

	 	  site_id=NormalmenuSite.find_by(tenant_id:params[:tenant_id],date:params[:date],meal_time:params[:meal_time]).id
  		
  		menu_id=NormalMenu.where(normalmenu_site_id:site_id).pluck("production_item_id")

      menu_id1=NormalMenu.where(normalmenu_site_id:site_id).ids
  	
	   	menureview={:NormalMenuid=>menu_id1,:MenuItems=>ProductionItem.where(id:menu_id).map{|pp| {:id=>pp.id,:menu=>pp.name,:answer=>["NoComplaint","Complaint"]}}}
  	
  		return menureview
    
    end

=end

end
