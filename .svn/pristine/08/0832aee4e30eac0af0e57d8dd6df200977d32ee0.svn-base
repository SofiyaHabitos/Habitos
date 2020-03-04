class PointOfSalesController < ApplicationController
  before_action :set_point_of_sale, only: [:show, :edit, :update, :destroy]

  # GET /point_of_sales
  # GET /point_of_sales.json
  def index
    @point_of_sales = PointOfSale.all.order('created_at DESC')
  end

  # GET /point_of_sales/1
  # GET /point_of_sales/1.json
  def show
    
  end

  # GET /point_of_sales/new
  def new    
    #params[:point_of_sale][:food_category_id] = FoodCategory.find_by(:name=> params[:point_of_sale][:food_category_id]).id
    @point_of_sale = PointOfSale.new
    @tenants = Tenant.where(:active => true)
    if params[:commit].present?
      @point_of_sale = PointOfSale.new(point_of_sale_params)
      @point_of_sale.food_category_id = FoodCategory.find_by('lower(name) =? ', "veg").id
      if @point_of_sale.save
        menu_customer_packs = MenuCustomer.find_by(date: @point_of_sale.date, tenant_id: @point_of_sale.tenant_id, meal_restriction_id: @point_of_sale.meal_restriction_id, category_id: Category.find_by(:category_name=>@point_of_sale.meal_time).id, stud_type: @point_of_sale.stud_type)
        if menu_customer_packs.present?
            count_to_update = menu_customer_packs.packs_to_send.to_i + @point_of_sale.quantity
            menu_customer_packs.update(:packs_to_send=>count_to_update)
        end
        redirect_to point_of_sales_path
      else
        redirect_to point_of_sales_path
      end
    end
    #if params[:tenant_id].present?
    #  @tenant_details = Tenant.find(params[:tenant_id]).tenant_details
    #end
  end

  def get_data
    #@tenant_id = Tenant.find(params[:format].to_i)
    @point_of_sale = PointOfSale.new
    @tenant_details = Tenant.find(params[:format].to_i).tenant_details
    @meal_restriction = []
    #redirect_to :action=>"new",:tenant_id=>@tenant_id
  end

  # GET /point_of_sales/1/edit
  def edit
   
  end

  # POST /point_of_sales
  # POST /point_of_sales.json
  def create
    respond_to do |format|
      if @point_of_sale.save
        menu_customer_packs = MenuCustomer.where(date: @point_of_sale.date,tenant_id: @point_of_sale.tenant_id).find_by(category_id: Category.find_by(:category_name=>@point_of_sale.meal_time).id)
        if menu_customer_packs.present?
            count_to_update = menu_customer_packs.packs_to_send.to_i + @point_of_sale.quantity
            menu_customer_packs.update(:packs_to_send=>count_to_update)
        end
         
        format.html { redirect_to point_of_sales_path, notice: 'Point of sale was successfully created.' }
        format.json { render :show, status: :created, location: @point_of_sale_path }
      else
        format.html { render :new }
        format.json { render json: @point_of_sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /point_of_sales/1
  # PATCH/PUT /point_of_sales/1.json
  def update
  
    #params[:point_of_sale][:food_category_id] = FoodCategory.find_by(:id=> params[:point_of_sale][:food_category_id]).name
    #params[:point_of_sale][:food_category_id] = FoodCategory.find_by(:name=> params[:point_of_sale][:food_category_id]).id
    respond_to do |format|
      if @point_of_sale.update(point_of_sale_params)
        format.html { redirect_to point_of_sales_path, notice: 'Point of sale was successfully updated.' }
        format.json { render :show, status: :ok, location: @point_of_sale }
      else
        format.html { render :edit }
        format.json { render json: @point_of_sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /point_of_sales/1
  # DELETE /point_of_sales/1.json
  def destroy

    @point_of_sale.destroy
    respond_to do |format|
      format.html { redirect_to point_of_sales_url, notice: 'Point of sale was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def check_tenant

    #@meal_time = Tenant.find_by(:id=>params[:tenant]).tenant_details.map{|i| Category.find_by(:category_name=>i.meal_time).id}
    @meal_time = TenantDetail.where(:tenant_id=> params[:tenant]).pluck(:meal_time)
    @foodcat_name = TenantDetail.where(:tenant_id=> params[:tenant]).map{|i| i.food_category.name}.uniq
    @fdate = Tenant.find_by(:id=> params[:tenant]).from_date
   
    @tdate = Tenant.find_by(:id=> params[:tenant]).to_date

    #@foodcat_name = TenantDetail.where(:tenant_id=> params[:tenant]).map{|i| i.id}
  end

   def check_date

    #@meal_time = Tenant.find_by(:id=>params[:tenant]).tenant_details.map{|i| Category.find_by(:category_name=>i.meal_time).id}
    @fdates = Tenant.where(id: params[:tenant]).pluck(:from_date, :to_date)
    #@tdates = Tenant.where(id: params[:tenant]).pluck(:to_date)
    render json: {"message"=> @fdates}  
    #render json: {"messagee"=>  @tdates}
  end

  def get_restriction
    meal_restrictions = Tenant.find(params[:tenant_id]).tenant_details.where(:meal_time => params[:meal_time]).pluck(:meal_restriction_id).compact
    @meal_restriction = MealRestriction.where(id: meal_restrictions)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_point_of_sale
      @point_of_sale = PointOfSale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def point_of_sale_params
      params.require(:point_of_sale).permit(:date, :tenant_id, :meal_time, :meal_restriction_id, :quantity, :food_category_id, :comment, :stud_type)
      #params.permit(:point_of_sale)
    end
end