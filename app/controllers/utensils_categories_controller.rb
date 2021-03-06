class UtensilsCategoriesController < ApplicationController
  before_action :set_utensils_category, only: [:show, :edit, :update, :destroy]

  # GET /utensils_categories
  # GET /utensils_categories.json
  def index
    @utensils_categories = UtensilsCategory.all
  end

  # GET /utensils_categories/1
  # GET /utensils_categories/1.json
  def show
  end

  # GET /utensils_categories/new
  def new
    @utensils_category = UtensilsCategory.new
  end

  # GET /utensils_categories/1/edit
  def edit
  end

  # POST /utensils_categories
  # POST /utensils_categories.json
  def create

    @utensils_category = UtensilsCategory.new(utensils_category_params)


    respond_to do |format|
      if @utensils_category.save
        @utensils_category.update(:created_by=>session[:kitchen_user_id],upload_status: params["upload_type"],asset_type: params["asset_type"])
        format.html { redirect_to action: "index", notice: 'Utensils category was successfully created.' }
        format.json { render :show, status: :created, location: @utensils_category }
      else
        format.html { render :new }
        format.json { render json: @utensils_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /utensils_categories/1
  # PATCH/PUT /utensils_categories/1.json
  def update
    respond_to do |format|
      if @utensils_category.update(utensils_category_params)
        @utensils_category.update(:updated_by=>session[:kitchen_user_id],upload_status: params["upload_type"],asset_type: params["asset_type"])
        format.html { redirect_to action: "index", notice: 'Utensils category was successfully updated.' }
        format.json { render :show, status: :ok, location: @utensils_category }
      else
        format.html { render :edit }
        format.json { render json: @utensils_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /utensils_categories/1
  # DELETE /utensils_categories/1.json
  def destroy
    @utensils_category.destroy
    respond_to do |format|
      format.html { redirect_to utensils_categories_url, notice: 'Utensils category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_utensils_category
      @utensils_category = UtensilsCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def utensils_category_params
      params.require(:utensils_category).permit(:utensils_category_name, :singleuse_status, :unit_of_measurement_id, :upload_status)
    end
end
