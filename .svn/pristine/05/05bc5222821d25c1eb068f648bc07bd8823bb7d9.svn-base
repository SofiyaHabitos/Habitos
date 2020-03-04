class FoodReturn < ApplicationRecord
  belongs_to :tenant
  belongs_to :menu_production_item 
  acts_as_paranoid
  #belongs_to :meal_calendar

=begin  def self.itemreturn(params)
  	kk = NormalmenuSite.where(date: Date.today, tenant_id: params[:tenant_id], meal_time: params[:meal_time]).ids
  	NormalMenu.where(normalmenu_site_id: kk).map{|pp| {:id => pp.id, :items => pp.production_item.name}}  	
  end
=end
  #FoodReturn(id: integer, date: date, tenant_id: integer, meal_time: string, reason: string, remark: string, image_id: integer, quantity: float, created_by: integer, updated_by: integer, created_at: datetime, updated_at: datetime, menu_production_item_id: integer)

  def self.food_returns_report(params)
    out_data = FoodReturn.get_data(params)
    p = Axlsx::Package.new
    p.workbook.add_worksheet(:name => "Food Return Report") do |sheet|
      sheet.add_row ["Date", "Tenant", "Meal Time", "Menu Item", "Return Qty", "Reason", "Comment"]
      out_data.each do |data|
        sheet.add_row [data[0], data[1], data[2], data[3], data[4], data[5], data[6]]
      end
    end
    path = "#{Rails.root}/public/export_files/food_return_report.xlsx"
    p.serialize(path)
    return path  	
  end

  def self.get_data(params)
    result = []
    food_returns = FoodReturn.where(tenant_id: params[:tenant][:id], date: params[:tenant][:from_date]..params[:tenant][:to_date])
	food_returns.map do |food_return|
	  result << [food_return.date.strftime('%d-%m-%Y'), food_return.tenant.name, food_return.meal_time, food_return.menu_production_item.production_item.name, food_return.quantity, food_return.reason, food_return.remark]
    end
    return result  	
  end

end
