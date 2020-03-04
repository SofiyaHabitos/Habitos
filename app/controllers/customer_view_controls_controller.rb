class CustomerViewControlsController < ApplicationController
  before_action :set_customer_view_control, only: [:show, :edit, :update, :destroy]
require 'rest-client'
  # GET /customer_view_controls
  # GET /customer_view_controls.json
  def index
    @customer_view_controls = CustomerViewControl.all.order('created_at DESC')
    #@customer_view_controls = CustomerViewControl.paginate(:page => params[:page], :per_page => 10)
  end

  # GET /customer_view_controls/1
  # GET /customer_view_controls/1.json
  def show
  end

  # GET /customer_view_controls/new
  def new
    @customer_view_control = CustomerViewControl.new
  end

  # GET /customer_view_controls/1/edit
  def edit
  end

  def billing_pop
    @customer_view = CustomerViewControl.find(params[:format])
  end

  def nutrition_pop
    @customer_view = CustomerViewControl.find(params[:format])
  end

  def bill_pop
   @customer_view = CustomerViewControl.find(params[:format])
  end


  # POST /customer_view_controls
  # POST /customer_view_controls.json
  def create
    
    @customer_view_control = CustomerViewControl.new(customer_view_control_params)
   
    respond_to do |format|
      if @customer_view_control.save
        @customer_view_control.update(:created_by=>session[:kitchen_user_id])
        format.html { redirect_to action: "index", notice: 'Customer view control was successfully created.' }
        format.json { render :show, status: :created, location: @customer_view_control }
      else
        format.html { render :new }
        format.json { render json: @customer_view_control.errors, status: :unprocessable_entity }
      end
    end
   # byebug
     # data =  JSON.parse RestClient.get("#{$api_service}/api/v1/users/data_upload?billing_upload="+params["customer_view_control"]["billing_upload"].tempfile.path)
  end

  # PATCH/PUT /customer_view_controls/1
  # PATCH/PUT /customer_view_controls/1.json
  def update
    respond_to do |format|
      if @customer_view_control.update(customer_view_control_params)
        @customer_view_control.update(:updated_by=>session[:kitchen_user_id])
        format.html { redirect_to action: "index", notice: 'Customer view control was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer_view_control }
      else
        format.html { render :edit }
        format.json { render json: @customer_view_control.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customer_view_controls/1
  # DELETE /customer_view_controls/1.json
  def destroy
    @customer_view_control.destroy
    respond_to do |format|
      format.html { redirect_to customer_view_controls_url, notice: 'Customer view control was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer_view_control
       unless params[:id] == "undefined"
       @customer_view_control = CustomerViewControl.find(params[:id])
    else
       redirect_to action: "index"
    end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_view_control_params
      params.require(:customer_view_control).permit(:tenant_id, :title, :billing_upload, :nutrition_upload, :bill)
    end
end
