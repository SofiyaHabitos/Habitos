class MenuCustomersController < ApplicationController
  before_action :set_menu_customer, only: [:edit, :update, :destroy]

  # GET /menu_customers
  # GET /menu_customers.json
  def index
    @menu_customers = MenuCustomer.all
  end

  # GET /menu_customers/1
  # GET /menu_customers/1.json
  def show
    @menu_customers = MenuCustomer.where(id: params[:id].split("/"))
  end

  # GET /menu_customers/new
  def new
    @menu_customer = MenuCustomer.new
  end

  # GET /menu_customers/1/edit
  def edit
  end

  # POST /menu_customers
  # POST /menu_customers.json
  def create
  
    @menu_customer = MenuCustomer.new(menu_customer_params)

    respond_to do |format|
      if @menu_customer.save
        MenuCustomer.daily_transction
        format.html { redirect_to @menu_customer, notice: 'Menu customer was successfully created.' }
        format.json { render :show, status: :created, location: @menu_customer }
      else
        format.html { render :new }
        format.json { render json: @menu_customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /menu_customers/1
  # PATCH/PUT /menu_customers/1.json
  def update
    respond_to do |format|
      if @menu_customer.update(menu_customer_params)
        format.html { redirect_to @menu_customer, notice: 'Menu customer was successfully updated.' }
        format.json { render :show, status: :ok, location: @menu_customer }
      else
        format.html { render :edit }
        format.json { render json: @menu_customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menu_customers/1
  # DELETE /menu_customers/1.json
  def destroy
    @menu_customer.destroy
    respond_to do |format|
      format.html { redirect_to menu_customers_url, notice: 'Menu customer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def daily_cook_sheet
  
    @menu_customer = MenuCycle.where(date: Date.today)
    if @menu_customer.present? 
        @menu_items = MenuCycle.daily_cook_sheet(Date.today)
      else
        @menu_items = []
    end
    
  end


  def cook_sheet_edit
  # Based on all filters 
    # @sitecategory = SiteCategory.pluck(:name,:id)
    # @tenant = Tenant.pluck(:name, :id)
    # @category = Category.all.order('position').pluck(:category_name,:id)

    # @spread = JSON.parse RestClient.get("#{$pim_core_service}/pimcore/api/FoodRecepie/SpreadName")

    # if params["vessel"].present?

    #   @tenantdetail = TenantDetail.where(tenant_id: params["vessel"]["clientname"].to_i, meal_time: Category.find(params["vessel"]["mealtype"]).category_name, stud_type: params["vessel"]["studtype"], spread_type: params["vessel"]["spreadtype"]).ids
    #   @menu = MenuCycle.where(date: Date.today,tenant_detail_id: @tenantdetail).includes(:category).order('categories.position ASC').group_by(&:category_id)
    # elsif params["filter"].present?
    #   @menu = MenuCycle.where(date: params["filter"]["date"]).includes(:category).order('categories.position ASC').group_by(&:category_id)
    # else
    #   @menu = MenuCycle.where(date: Date.today).includes(:category).order('categories.position ASC').group_by(&:category_id)
    # end 
  #Based on multiple select and three filters
    @sitecategory = SiteCategory.pluck(:name,:id)
    tenant_detail_id = MenuCycle.pluck(:tenant_detail_id).uniq
    tenant_id = TenantDetail.where(id: tenant_detail_id).pluck(:tenant_id)
    @tenant  = Tenant.where(id: tenant_id).pluck(:name,:id)

    # @tenant = Tenant.pluck(:name, :id)
    @category = Category.all.order('position').pluck(:category_name,:id)
    @spread = JSON.parse RestClient.get("#{$pim_core_service}/pimcore/api/FoodRecepie/SpreadName")
    @params = params["vessel"] if params.present? # for displaying the selected params in the filter drop downs
    if params["vessel"].present?
      @tenantdetail = TenantDetail.where(tenant_id: params["vessel"]["clientname"].to_i, meal_time: Category.where(id: params["vessel"]["mealtype"].reject(&:blank?)).pluck(:category_name)).ids
      @menu = MenuCycle.where(date: params["vessel"]["date"],tenant_detail_id: @tenantdetail).includes(:category).order('categories.position ASC').group_by(&:category_id)
    elsif params["filter"].present?
      @menu = MenuCycle.where(date: params["filter"]["date"]).includes(:category).order('categories.position ASC').group_by(&:category_id)
    else
      @menu = MenuCycle.where(date: Date.today).includes(:category).order('categories.position ASC').group_by(&:category_id)
    end

 
  end

  def cook_edit
  
    cook = MenuCycle.find(params["id"])
    keys=params["menu_items"]
    values=params["qty"]
    menu = [keys.map(&:to_s), values.map(&:to_s)].transpose
    menu.each_with_index do |val, index|
     cook.menu_items.map {|i|  i["qty"] = val[1] && i["Portion_size"]=val[1] if  i["name"] == val[0]}      
     cook.update(menu_items: cook.menu_items)
    end

    #cook =MenuCycle.find(params["id"])
    #@cook.menu_items.map {|i|  i["qty"] = params["quantity"] if  i["name"] == params["item_name"]}
    #cook.updated(menu_items: cook.menu_items)

    cookquantity = cook.update(quantity: params["quantity"])
    #redirect_to menu_customers_cook_sheet_edit_path, filter: {date: params[:date_choosen]}
    redirect_to controller: 'menu_customers', action: 'cook_sheet_edit', filter: {date: params[:date_choosen]}
    
  end


  def update_total_qty
    params[:total_qty].map do |menucycle_id, total_qty|
      menu_cycle = MenuCycle.find(menucycle_id.to_i)
      menu_cycle.update(quantity: total_qty.to_f) if menu_cycle.present?
    end
    #redirect_to menu_customers_cook_sheet_edit_path, "filter[:date]": params[:date_choosen]
    redirect_to controller: 'menu_customers', action: 'cook_sheet_edit', filter: {date: params[:date_choosen]}
  end

  
  def csv_sheet
    file_path = MenuCustomer.file_generate(params)
    send_file file_path  
  end  


  def mail_cooksheet
        email_id = params["receiver_email"]
        menu_id = params["menu"].join(" ")
        menu = MenuCycle.find(menu_id)
        params_to_send = {"sheet" => {"from_date" => menu.date, "to_date" => menu.date, "cook_sheet" => true}}
        cook_sheet_url = MenuCustomer.file_generate(params_to_send)
        KitchenNotifierMailer.send_cooksheet(cook_sheet_url, email_id).deliver_now
        redirect_to menu_customers_cook_sheet_edit_path
  end

  def dropdown
    
    tenant_detail_ids = MenuCycle.where(status: nil).pluck(:tenant_detail_id).uniq
    tenantname = Tenant.includes(:tenant_details).where(site_category_id: params["val"]).where(:tenant_details => {id: tenant_detail_ids}).uniq.pluck(:name, :id)
      client_type = SiteCategory.find(params["val"])
      spread_type_ids = client_type.client_spread_types.pluck(:spread_type_id).join(",")
      spread_type_response = RestClient.get("#{$pim_core_service}/pimcore/api/FoodRecepie/SpreadName?id="+spread_type_ids)
      spread_data = JSON.parse(spread_type_response)
      @Client= {client_categories: client_type.client_categories, Spread: spread_data["Spread"], Tenant: tenantname }

  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu_customer
      @menu_customer = MenuCustomer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def menu_customer_params

      params.require(:menu_customer).permit! #(:date, :tenant_id, :menu_master_id, :category_id, :order_no)
    end


 
end
