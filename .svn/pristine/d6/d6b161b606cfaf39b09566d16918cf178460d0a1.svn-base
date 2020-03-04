class MenuProductionItemsController < ApplicationController
  before_action :set_menu_production_item, only: [:show, :edit, :update, :destroy]

  # GET /menu_production_items
  # GET /menu_production_items.json
  def index
    @menu_production_items = MenuProductionItem.all
  end

  # GET /menu_production_items/1
  # GET /menu_production_items/1.json
  def show
  end

  # GET /menu_production_items/new
  def new
    @menu_production_item = MenuProductionItem.new
  end

  # GET /menu_production_items/1/edit
  def edit
  end

  # POST /menu_production_items
  # POST /menu_production_items.json
  def create
    @menu_production_item = MenuProductionItem.new(menu_production_item_params)

    respond_to do |format|
      if @menu_production_item.save
        format.html { redirect_to @menu_production_item, notice: 'Menu production item was successfully created.' }
        format.json { render :show, status: :created, location: @menu_production_item }
      else
        format.html { render :new }
        format.json { render json: @menu_production_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /menu_production_items/1
  # PATCH/PUT /menu_production_items/1.json
  def update
    respond_to do |format|
      if @menu_production_item.update(menu_production_item_params)
        format.html { redirect_to @menu_production_item, notice: 'Menu production item was successfully updated.' }
        format.json { render :show, status: :ok, location: @menu_production_item }
      else
        format.html { render :edit }
        format.json { render json: @menu_production_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menu_production_items/1
  # DELETE /menu_production_items/1.json
  def destroy
    @menu_production_item.destroy
    respond_to do |format|
      format.html { redirect_to menu_production_items_url, notice: 'Menu production item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu_production_item
      @menu_production_item = MenuProductionItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def menu_production_item_params
      params.require(:menu_production_item).permit(:menu_master_id, :production_item_id, :quantity, :meal_course_id)
    end
end
