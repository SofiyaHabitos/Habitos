class Dispatch < ApplicationRecord
  belongs_to :tenant
  belongs_to :utensil
  has_many :dispatch_utensils_mappings, dependent: :destroy
  
  has_one :menu_customer_dispatch, dependent: :destroy
  has_one :menu_customer, through: :menu_customer_dispatch#, dependent: :destroy
  
  belongs_to :menu_production_item#, optional: true  
  has_many :deliveries, dependent: :destroy 
  acts_as_paranoid
  
    def self.history(params)
    
      {:history=>{:dispatch=>Dispatch.where(date:params[:date]).where(tenant_id:params[:tenant_id]).where(:meal_time=>params[:meal_time]).map { |pp| { :date=>pp.date,:tenant_id=>Tenant.find(pp.tenant_id).name,:normal_menu_id=>ProductionItem.find(NormalMenu.where(id:pp.normal_menu_id).pluck(:production_item_id)[0]).name,:category_name=>pp.category_name,:quantity=>pp.quantity,:no_of_utensil=>pp.no_of_utensil}}},:returns=>FoodReturn.where(date:params[:date],tenant_id:params[:tenant_id],meal_time:params[:meal_time]).map { |pp| {:date=>pp.date,:tenant_id=>Tenant.find(pp.tenant_id).name,:meal_time=>pp.meal_time,:normal_menu_id=>ProductionItem.find(NormalMenu.where(id:pp.normal_menu_id).pluck(:production_item_id)[0]).name,:reason_type=>pp.reason_type,:remark=>pp.remark,:image=>pp.image,:quantity=>pp.quantity}},:wastage=>Wastage.where(date:params[:date],tenant_id:params[:tenant_id],meal_time:params[:meal_time]).map { |pp| {:date=>pp.date,:tenant_id=>Tenant.find(pp.tenant_id).name,:meal_time=>pp.meal_time,:wastage_quantity=>pp.wastage_quantity,:unit_of_measurement_id=>UnitOfMeasurement.find(pp.unit_of_measurement_id).name,:total_qty=>pp.total_qty,:image=>pp.image,:remark=>pp.remark}}}

    end

    def self.dispatch_status(menu)
      #@data = Dispatch.where(:date => menu.date, :tenant_id => menu.tenant_id, :meal_time => menu.category.category_name)
      @data = menu.menu_customer_dispatches.map{|i| i.dispatch}
      return @data
    
    end

    def self.delivery_status(menu)
      deliv = Delivery.where(date: menu.date, meal_time: Category.find(menu.category_id).category_name, tenant_id: menu.tenant_id)
      return deliv    
    end

    def self.utensil_status(menu)
      #dispat_id = Dispatch.where(:date=>menu.date,:tenant_id=>menu.tenant_id,:meal_time=>menu.category.category_name).ids
      dispat_id = menu.menu_customer_dispatches.pluck(:dispatch_id)
      utensil_data = DispatchUtensilsMapping.where(dispatch_id: dispat_id)
      return utensil_data    
    end

end