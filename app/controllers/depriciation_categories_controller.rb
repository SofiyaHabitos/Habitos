class DepriciationCategoriesController < ApplicationController
  before_action :set_depriciation_category, only: [:show, :edit, :update, :destroy]

  # GET /depriciation_categories
  # GET /depriciation_categories.json
  def index
    @depriciation_categories = DepriciationCategory.all
  end

  # GET /depriciation_categories/1
  # GET /depriciation_categories/1.json
  def show
  end

  # GET /depriciation_categories/new
  def new
    @depriciation_category = DepriciationCategory.new
  end

  # GET /depriciation_categories/1/edit
  def edit
  end

  # POST /depriciation_categories
  # POST /depriciation_categories.json
  def create
    @depriciation_category = DepriciationCategory.new(depriciation_category_params)

    respond_to do |format|
      if @depriciation_category.save
        format.html { redirect_to depriciation_categories_path }
        format.json { render :show, status: :created, location: @depriciation_category }
      else
        format.html { render :new }
        format.json { render json: @depriciation_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /depriciation_categories/1
  # PATCH/PUT /depriciation_categories/1.json
  def update
    respond_to do |format|
      if @depriciation_category.update(depriciation_category_params)
        format.html { redirect_to depriciation_categories_path }
        format.json { render :show, status: :ok, location: @depriciation_category }
      else
        format.html { render :edit }
        format.json { render json: @depriciation_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /depriciation_categories/1
  # DELETE /depriciation_categories/1.json
  def destroy
    @depriciation_category.destroy
    respond_to do |format|
      format.html { redirect_to depriciation_categories_url, notice: 'Depriciation category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_depriciation_category
      @depriciation_category = DepriciationCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def depriciation_category_params
      params.require(:depriciation_category).permit(:name, :description, :depreciation_percentage)
    end
end
