class MenuMastersController < ApplicationController
  before_action :set_menu_master, only: [:show, :edit, :update, :destroy]

  # GET /menu_masters
  # GET /menu_masters.json
  def index
    @menu_masters = MenuMaster.all
  end

  # GET /menu_masters/1
  # GET /menu_masters/1.json
  def show
  end

  # GET /menu_masters/new
  def new
    @menu_master = MenuMaster.new
  end

  # GET /menu_masters/1/edit
  def edit
  end

  # POST /menu_masters
  # POST /menu_masters.json
  def create
  
    @menu_master = MenuMaster.new(menu_master_params)

    respond_to do |format|
      if @menu_master.save
        format.html { redirect_to @menu_master, notice: 'Menu master was successfully created.' }
        format.json { render :show, status: :created, location: @menu_master }
      else
        format.html { render :new }
        format.json { render json: @menu_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /menu_masters/1
  # PATCH/PUT /menu_masters/1.json
  def update
    respond_to do |format|
      if @menu_master.update(menu_master_params)
        format.html { redirect_to @menu_master, notice: 'Menu master was successfully updated.' }
        format.json { render :show, status: :ok, location: @menu_master }
      else
        format.html { render :edit }
        format.json { render json: @menu_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menu_masters/1
  # DELETE /menu_masters/1.json
  def destroy
    @menu_master.destroy
    respond_to do |format|
      format.html { redirect_to menu_masters_url, notice: 'Menu master was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def menumaster_report
    
    file_path = MenuMaster.menumaster_report(params)
    send_file file_path  
  end
  
  




  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu_master
      @menu_master = MenuMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def menu_master_params
      params.require(:menu_master).permit(:menu_master_name, :category_id, :cost, :food_category_id, :meal_restriction_id, :allery_id, :created_by, :updated_by)
    end
end
