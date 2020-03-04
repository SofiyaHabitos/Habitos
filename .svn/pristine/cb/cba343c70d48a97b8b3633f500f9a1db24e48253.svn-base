class ProductionCategoriesController < ApplicationController
  before_action :set_production_category, only: [:show, :edit, :update, :destroy]

  # GET /production_categories
  # GET /production_categories.json
  def index
    @production_categories = ProductionCategory.all
  end

  # GET /production_categories/1
  # GET /production_categories/1.json
  def show
  end

  # GET /production_categories/new
  def new
    @production_category = ProductionCategory.new
  end

  # GET /production_categories/1/edit
  def edit
  end

  # POST /production_categories
  # POST /production_categories.json
  def create
    @production_category = ProductionCategory.new(production_category_params)

    respond_to do |format|
      if @production_category.save
        @production_category.update(:created_by=>session[:kitchen_user_id])
        format.html { redirect_to action: "index", notice: 'Production category was successfully created.' }
        format.json { render :show, status: :created, location: @production_category }
      else
        format.html { render :new }
        format.json { render json: @production_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /production_categories/1
  # PATCH/PUT /production_categories/1.json
  def update
    respond_to do |format|
      if @production_category.update(production_category_params)
        @production_category.update(:updated_by=>session[:kitchen_user_id])
        format.html { redirect_to action: "index", notice: 'Production category was successfully updated.' }
        format.json { render :show, status: :ok, location: @production_category }
      else
        format.html { render :edit }
        format.json { render json: @production_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /production_categories/1
  # DELETE /production_categories/1.json
  def destroy
    @production_category.destroy
    respond_to do |format|
      format.html { redirect_to production_categories_url, notice: 'Production category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_production_category
      @production_category = ProductionCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def production_category_params
      #params.fetch(:production_category, {})
      params.require(:production_category).permit(:name, :description)
      
    end
end
