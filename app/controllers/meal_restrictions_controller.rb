class MealRestrictionsController < ApplicationController
  before_action :set_meal_restriction, only: [:show, :edit, :update, :destroy]

  # GET /meal_restrictions
  # GET /meal_restrictions.json
  def index
    @meal_restrictions = MealRestriction.where.not(:meal_restriction_name=>"None")
  end

  # GET /meal_restrictions/1
  # GET /meal_restrictions/1.json
  def show
  end

  # GET /meal_restrictions/new
  def new
    @meal_restriction = MealRestriction.new
  end

  # GET /meal_restrictions/1/edit
  def edit
  end

  # POST /meal_restrictions
  # POST /meal_restrictions.json
  def create
    @meal_restriction = MealRestriction.new(meal_restriction_params)
    @meal_restriction.created_by = KitchenUser.find(session[:kitchen_user_id]).name

    respond_to do |format|
      if @meal_restriction.save
        format.html { redirect_to action: "index", notice: 'Meal restriction was successfully created.' }
        format.json { render :show, status: :created, location: @meal_restriction }
      else
        format.html { render :new }
        format.json { render json: @meal_restriction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meal_restrictions/1
  # PATCH/PUT /meal_restrictions/1.json
  def update
    @meal_restriction.updated_by = KitchenUser.find(session[:kitchen_user_id]).name
    respond_to do |format|
      if @meal_restriction.update(meal_restriction_params)
        format.html { redirect_to action: "index", notice: 'Meal restriction was successfully updated.' }
        format.json { render :show, status: :ok, location: @meal_restriction }
      else
        format.html { render :edit }
        format.json { render json: @meal_restriction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meal_restrictions/1
  # DELETE /meal_restrictions/1.json
  def destroy
    @meal_restriction.destroy
    respond_to do |format|
      format.html { redirect_to meal_restrictions_url, notice: 'Meal restriction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meal_restriction
      @meal_restriction = MealRestriction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meal_restriction_params
      params.require(:meal_restriction).permit(:meal_restriction_name, :created_by, :updated_by)
    end
end
