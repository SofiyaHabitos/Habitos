class NormalmenuSite < ApplicationRecord
  belongs_to :tenant
  belongs_to :attendance, optional:true
  has_many :normal_menus,  :dependent => :destroy
 # has_many :mealorders,  :dependent => :destroy
 # has_many :unit_of_measurements,  :dependent => :destroy
  #has_many :utensils,  :dependent => :destroy
  
  
  #validates :meal_time, uniqueness: {scope: [:date, :tenant_id]}
  #accepts_nested_attributes_for :mealorders, :allow_destroy => true
  accepts_nested_attributes_for :normal_menus, :allow_destroy => true
  
    def self.multipleorder(params)

      if params[:type] == "all"

        order=[{:Order=>NormalmenuSite.where(date:Date.today).uniq.map{|pp|{:date=>pp.date,:tenant=>pp.tenant,:meal_time=>pp.meal_time,:time=>pp.time,:flag_id=>pp.id,:flag=>pp.flag,:delivery_status=>pp.delivery_status}}}]

      else
        
        order=[{:Order=>NormalmenuSite.where(date:params[:type]).map{|pp|{:date=>pp.date,:tenant=>pp.tenant,:meal_time=>pp.meal_time,:time=>pp.time,:flag_id=>pp.id,:flag=>pp.flag,:delivery_status=>pp.delivery_status}}}]

      end 

      return order
    
    end

    def self.mealorder(params)

      tn=Tenant.find(params[:tenant_id])

      mm=User.where("from_date <= ? AND to_date >= ?", Date.today, Date.today).where(tenant_id:tn).count

      meallist={:tenant=>tn.name,:normal_menu=>tn.normalmenu_sites.where(:date=>Date.today,meal_time:params[:meal_time]).map{|pp| {:id=>pp.id,:date=>Date.today,:meal_time=>pp.meal_time,:items=>pp.normal_menus.map{|ll| {:item_name=>ll.production_item.name,:quantity=>ll.quantity,:uom=>ll.unit_of_measurement.name,:totalqty=>ll.quantity*mm}}}}}

      return meallist

    end

    def self.data_create(tenant_details_params, image_params, id)
    image = Image.new(image_params[:image_attributes])
    image.tenant_id = id
    image.save!
    tenant_details_params["tenant_details_attributes"].map do|kk|
        td = TenantDetail.new(kk.last)
        td.tenant_id = id
        td.save!
    end
  end

end
