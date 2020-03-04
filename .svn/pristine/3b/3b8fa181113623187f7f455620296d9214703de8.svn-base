class DispatchesController < ApplicationController
  before_action :set_dispatch, only: [:show, :edit, :update, :destroy]

  # GET /dispatches
  # GET /dispatches.json
  def index
    @dispatches = Dispatch.all
  end

  # GET /dispatches/1
  # GET /dispatches/1.json
  def show
  end

  # GET /dispatches/new
  def new
    @dispatch = Dispatch.new
  end

  # GET /dispatches/1/edit
  def edit
  end

  # POST /dispatches
  # POST /dispatches.json
  def create
    @dispatch = Dispatch.new(dispatch_params)

    respond_to do |format|
      if @dispatch.save
        format.html { redirect_to action: "index", notice: 'Dispatch was successfully created.' }
        format.json { render :show, status: :created, location: @dispatch }
      else
        format.html { render :new }
        format.json { render json: @dispatch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dispatches/1
  # PATCH/PUT /dispatches/1.json
  def update
    respond_to do |format|
      if @dispatch.update(dispatch_params)
        format.html { redirect_to action: "index", notice: 'Dispatch was successfully updated.' }
        format.json { render :show, status: :ok, location: @dispatch }
      else
        format.html { render :edit }
        format.json { render json: @dispatch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dispatches/1
  # DELETE /dispatches/1.json
  def destroy
    @dispatch.destroy
    respond_to do |format|
      format.html { redirect_to dispatches_url, notice: 'Dispatch was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def delivery_report
    file_path = DeliveryHistory.delivery_report(params)
    send_file file_path  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dispatch
      @dispatch = Dispatch.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dispatch_params
      #params.fetch(:dispatch, {})
      params.require(:dispatch).permit(:date, :tenant_id, :normal_menu_id, :category_name, :quantity, :no_of_utensil)
    end
end
