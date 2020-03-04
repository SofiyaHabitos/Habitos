class FoodCategoriesController < ApplicationController
  before_action :set_food_category, only: [:show, :edit, :update, :destroy]

  # GET /food_categories
  # GET /food_categories.json
  def index
    @food_categories = FoodCategory.all
  end

  # GET /food_categories/1
  # GET /food_categories/1.json
  def show
  end

  # GET /food_categories/new
  def new
    @food_category = FoodCategory.new
  end

  # GET /food_categories/1/edit
  def edit
  end

  # POST /food_categories
  # POST /food_categories.json
  def create
    @food_category = FoodCategory.new(food_category_params)

    respond_to do |format|
      if @food_category.save
        @food_category.update(:created_by=>session[:kitchen_user_id])
        format.html { redirect_to action: "index", notice: 'Food category was successfully created.' }
        format.json { render :show, status: :created, location: @food_category }
      else
        format.html { render :_form }
        format.json { render json: @food_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /food_categories/1
  # PATCH/PUT /food_categories/1.json
  def update
    respond_to do |format|
      if @food_category.update(food_category_params)
        @food_category.update(:updated_by=>session[:kitchen_user_id])
        format.html { redirect_to action: "index", notice: 'Food category was successfully updated.' }
        format.json { render :show, status: :ok, location: @food_category }
      else
        format.html { render :edit }
        format.json { render json: @food_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /food_categories/1
  # DELETE /food_categories/1.json
  def destroy
    @food_category.destroy
    respond_to do |format|
      format.html { redirect_to food_categories_url, notice: 'Food category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food_category
      @food_category = FoodCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def food_category_params
      params.require(:food_category).permit(:name, :description, :created_by, :updated_by)
    end
end
