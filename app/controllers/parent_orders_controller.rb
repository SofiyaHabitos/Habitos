class ParentOrdersController < ApplicationController
  before_action :set_parent_order, only: [:show, :edit, :update, :destroy]

  # GET /parent_orders
  # GET /parent_orders.json
  def index
    @parent_orders = ParentOrder.all
   # @parent_orders = ParentOrder.paginate(:page => params[:page], :per_page => 10)
  end

  # GET /parent_orders/1
  # GET /parent_orders/1.json
  def show
  end

  # GET /parent_orders/new
  def new
    @parent_order = ParentOrder.new
  end

  # GET /parent_orders/1/edit
  def edit
  end

  # POST /parent_orders
  # POST /parent_orders.json
  def create
    @parent_order = ParentOrder.new(parent_order_params)

    respond_to do |format|
      if @parent_order.save
        format.html { redirect_to action: "index", notice: 'Parent order was successfully created.' }
        format.json { render :show, status: :created, location: @parent_order }
      else
        format.html { render :new }
        format.json { render json: @parent_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parent_orders/1
  # PATCH/PUT /parent_orders/1.json
  def update
    respond_to do |format|
      if @parent_order.update(parent_order_params)
        format.html { redirect_to action: "index", notice: 'Parent order was successfully updated.' }
        format.json { render :show, status: :ok, location: @parent_order }
      else
        format.html { render :edit }
        format.json { render json: @parent_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parent_orders/1
  # DELETE /parent_orders/1.json
  def destroy
    @parent_order.destroy
    respond_to do |format|
      format.html { redirect_to parent_orders_url, notice: 'Parent order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parent_order
      @parent_order = ParentOrder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def parent_order_params
      #params.fetch(:parent_order, {})
      params.require(:parent_order).permit(:tenant_id, :meal_time, :identity_number, :amount, :food_category_id, :order_status, :order_date)
    end
end
