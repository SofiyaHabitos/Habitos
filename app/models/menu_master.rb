class MenuMaster < ApplicationRecord
	
	belongs_to :category
	belongs_to :food_category
	belongs_to :meal_restriction, optional: true
	belongs_to :allery, optional: true
	has_many :menu_production_items, dependent: :destroy
	has_many :menu_customers, dependent: :destroy
	validates_uniqueness_of :menu_master_name, presence: true
	acts_as_paranoid

  	def self.menumaster_report(params)
  		from_date = params["menu_master"]["from_date"]
     	to_date = params["menu_master"]["to_date"] 
     	@menus=MenuMaster.where(:created_at => (from_date..to_date))
  	  	p = Axlsx::Package.new
		    sheet = p.workbook.add_worksheet(:name => "Menus Report")
    		title = sheet.styles.add_style(:fg_color=>"#FF000000",:b => true,:alignment=>{:horizontal => :center})
		    sheet.add_row ["From Date:", from_date.to_date.strftime("%d-%m-%Y"), "To Date:", to_date.to_date.strftime("%d-%m-%Y")], :style=>title
    		sheet.add_row ["Date", "Meal group name", "Meal time", "Food category", "Meal Restriction", "Allergy", "Items and Quantity"], :style=>title
            
		   	@menus.map do |i|
		   		a=[]    		
		   		a = i.menu_production_items.map{|j| {"#{j.production_item.name}"=> j.quantity.to_f}}	   		
		   		b=a.reduce Hash.new, :merge
		   		#i.menu_production_items.map{|j| a << {:"#{j.production_item.name}"=> j.quantity.to_i}}
		   		sheet.add_row [i.created_at.to_date.strftime('%d-%m-%Y'),i.menu_master_name,i.category.category_name, i.food_category.name, i.meal_restriction.present? ? i.meal_restriction.meal_restriction_name : nil,i.allery.present? ? i.allery.name : nil, b]
    		end
		    path = "#{Rails.root}/public/export_files/menus_report.xlsx"
    		p.serialize(path)
    		return path
  	end


end
