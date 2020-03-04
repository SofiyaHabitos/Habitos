class TenantDetailsController < ApplicationController
  before_action :set_tenant_detail, only: [:show, :edit, :update, :destroy,:summary_edit]

  # GET /tenant_details
  # GET /tenant_details.json
  def index
    @tenant_details = TenantDetail.all
  end

  # GET /tenant_details/1
  # GET /tenant_details/1.json
  def show
  end

  # GET /tenant_details/new
  def new
    @tenant_detail = TenantDetail.new
  end

  # GET /tenant_details/1/edit
  def edit
#@tenant_detail = TenantDetail.find(params[:id])
  end

  def summary_edit 
     @tenant_detail = TenantDetail.find(params[:id])
  end  

  # POST /tenant_details
  # POST /tenant_details.json
  def create
    @tenant_detail = TenantDetail.new(tenant_detail_params)
       
    respond_to do |format|
      if @tenant_detail.save
        @tenant_detail.update(:created_by=>session[:kitchen_user_id])
        format.html { redirect_to action: "index", notice: 'Tenant detail was successfully created.' }
        format.json { render :show, status: :created, location: @tenant_detail }
      else
        format.html { render :new }
        format.json { render json: @tenant_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tenant_details/1
  # PATCH/PUT /tenant_details/1.json
  def update
    respond_to do |format|
      if @tenant_detail.update(tenant_detail_params)
        @tenant_detail.update(:updated_by=>session[:kitchen_user_id])
        format.html { redirect_to summaries_path, notice: 'Tenant detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @tenant_detail }
      else
        format.html { render :edit }
        format.json { render json: @tenant_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tenant_details/1
  # DELETE /tenant_details/1.json
  def destroy
    @tenant_detail.destroy
    respond_to do |format|
      format.html { redirect_to tenant_details_url, notice: 'Tenant detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tenant_detail
      @tenant_detail = TenantDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tenant_detail_params
      params.require(:tenant_detail).permit(:meal_plan, :meal_time, :meal_type, :age_type, :order, :quantity, :total_quantity, :actval_quantity, :cost, :tenant_id,:dispatch_time,:delivery_time)
    end
end
