class NormalmenuSitesController < ApplicationController

  def index
    if params["cus_id"].present?
      MenuCustomer.find(params["cus_id"]).destroy
    end
    @tenants = Tenant.where("from_date <= ? AND to_date >= ?", Date.today, Date.today).where(active: true)
    @orders = MenuCustomer.menu_assign_index(@tenants)
  end

  def dashboard    
    @total_orders = MenuCustomer.where(date: Date.today).pluck(:packs_to_send).compact.sum
    @instant_orders = PointOfSale.where(date: Date.today)
    @parent_orders = ParentOrder.where(date: Date.today)
    @vessels_uncollected = DispatchUtensilsMapping.where(:status=>"Not Received")
    @tenants = Tenant.where("from_date <= ? AND to_date >= ?", Date.today, Date.today).where(active: true)
    @categories = Category.all.pluck(:category_name)
    @menu_customers = MenuCustomer.where(date: Date.today)

  #  render :layout => false
  end
  
  def wastage
    @tenant_id = Tenant.find_by(name: params[:name]).id
    @food_returns = FoodReturn.where(tenant_id: @tenant_id)
  end

  def show
  end

  def drop
    @mealtime=TenantDetail.where(tenant_id:params[:format])
  end

  def dropdown1   
    @food_category=TenantDetail.where(id:params[:format])
  end

  def order_status
    @tenant = Tenant.new
    @tenants = Tenant.where(active: true)
  end

  def summary

    @tenant = Tenant.new

    @tenants = Tenant.where("from_date <= ? AND to_date >= ?", Date.today, Date.today).where(active: true)

    @orders = MenuCustomer.summary(@tenants)

    unless params[:pos_enrolled_data].nil? && params[:enrolled_data].nil? && params[:individual_enrolled_data].nil?
    
      @enrolled_data = params[:enrolled_data]
    
      @pos_enrolled_data = params[:pos_enrolled_data]
    
      @individual_enrolled_data = params[:individual_enrolled_data]
    
    end
  
  end

  def summary_edit 

    @tenant_detail = TenantDetail.find(params[:id])

  end  

  def enrolled
  
    @enrolled_data = TenantDetail.enrolledcount(@normalmenu_site)
  
    @pos_enrolled_data = TenantDetail.posenrolledcount(@normalmenu_site)
  
    @individual_enrolled_data = TenantDetail.individualenrolleddata(@normalmenu_site)
  
    redirect_to summaries_path(enrolled_data:@enrolled_data,pos_enrolled_data:@pos_enrolled_data,individual_enrolled_data:@individual_enrolled_data)
  
  end

  def dispatch_status
      @menu_customer = MenuCustomer.find(params[:id])
      @dispatch_status=Dispatch.dispatch_status(@menu_customer)
  end


   def delivery_status
    @menu_customer = MenuCustomer.find(params[:id])
    @delivery_status=Dispatch.delivery_status(@menu_customer)
   end

   
  def utensil_status
    @menu_customer = MenuCustomer.find(params[:id])
    @utensil_status=Dispatch.utensil_status(@menu_customer)
  end

  def menu_planner
  end

  def menu_assign    
  end

  def notreceive_status
    
    #@utensils_notreceived = DispatchUtensilsMapping.where(:status=>"Not Received")  
    #@utensils_notreceived = VesselDispatch.all.where(tag: Tag.where(status: "Dispatched")).includes(:tenant_detail,:tag)
    @utensils_notreceived = VesselDispatch.where(utensil_received: false, tag: Tag.where(status: "Dispatched")).includes(:tenant_detail,:tag)  
  end

  def menu_cycle
  end

  def menu_cycle_assign
  end
  
  def dropdown
  end

  def stores
  end
end
