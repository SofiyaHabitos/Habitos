class ItemMealRestrictionsController < ApplicationController
  before_action :set_item_meal_restriction, only: [:show, :edit, :update, :destroy]

  # GET /item_meal_restrictions
  # GET /item_meal_restrictions.json
  def index
    @item_meal_restrictions = ItemMealRestriction.all
  end

  # GET /item_meal_restrictions/1
  # GET /item_meal_restrictions/1.json
  def show
  end

  # GET /item_meal_restrictions/new
  def new
    @item_meal_restriction = ItemMealRestriction.new
  end

  # GET /item_meal_restrictions/1/edit
  def edit
  end

  # POST /item_meal_restrictions
  # POST /item_meal_restrictions.json
  def create
    @item_meal_restriction = ItemMealRestriction.new(item_meal_restriction_params)

    respond_to do |format|
      if @item_meal_restriction.save
        format.html { redirect_to @item_meal_restriction, notice: 'Item meal restriction was successfully created.' }
        format.json { render :show, status: :created, location: @item_meal_restriction }
      else
        format.html { render :new }
        format.json { render json: @item_meal_restriction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /item_meal_restrictions/1
  # PATCH/PUT /item_meal_restrictions/1.json
  def update
    respond_to do |format|
      if @item_meal_restriction.update(item_meal_restriction_params)
        format.html { redirect_to @item_meal_restriction, notice: 'Item meal restriction was successfully updated.' }
        format.json { render :show, status: :ok, location: @item_meal_restriction }
      else
        format.html { render :edit }
        format.json { render json: @item_meal_restriction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_meal_restrictions/1
  # DELETE /item_meal_restrictions/1.json
  def destroy
    @item_meal_restriction.destroy
    respond_to do |format|
      format.html { redirect_to item_meal_restrictions_url, notice: 'Item meal restriction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_meal_restriction
      @item_meal_restriction = ItemMealRestriction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_meal_restriction_params
      params.require(:item_meal_restriction).permit(:production_item_id, :meal_restriction_id, :created_by, :updated_by)
    end
end
