class SiteCategoriesController < ApplicationController
  before_action :set_site_category, only: [:show, :edit, :update, :destroy]

  # GET /site_categories
  # GET /site_categories.json
  def index
    @site_categories = SiteCategory.all.includes(:client_type_categories, :client_spread_types)   #where.not(:name=>"Provider")
  end

  # GET /site_categories/1
  # GET /site_categories/1.json
  def show
  end

  # GET /site_categories/new
  def new
    @site_category = SiteCategory.new
    @site_category.client_type_categories.build
    @site_category.client_spread_types.build
  end

  # GET /site_categories/1/edit
  def edit
  end

  # POST /site_categories
  # POST /site_categories.json
  def create
    @site_category = SiteCategory.new(site_category_params)

    SiteCategory.client_spread_category(params[:client_category_id][:id], params[:spread_type_id], @site_category)

    respond_to do |format|
      if @site_category.save
        @site_category.update(:created_by=>session[:kitchen_user_id])
        format.html { redirect_to action: "index", notice: 'Site category was successfully created.' }
        format.json { render :show, status: :created, location: @site_category }
      else
        format.html { render :new }
        format.json { render json: @site_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /site_categories/1
  # PATCH/PUT /site_categories/1.json
  def update
    respond_to do |format|
      if @site_category.update(site_category_params)

        @site_category.client_categories = []
        params[:client_category_id][:id].each do |category|
          if !category.empty?
            @site_category.client_categories << ClientCategory.find(category)
          end
        end

        @site_category.client_spread_types = []
        params[:spread_type_id].each do |spread|
          if !spread.empty?
            @site_category.client_spread_types.build(:spread_type_id => spread)
           # @site_category.client_spread_types << @site_category.client_spread_types.find_by(spread_type_id: spread.to_i)
          end
        end

        @site_category.update(:updated_by=>session[:kitchen_user_id])
        format.html { redirect_to action: "index", notice: 'Site category was successfully updated.' }
        format.json { render :show, status: :ok, location: @site_category }
      else
        format.html { render :edit }
        format.json { render json: @site_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /site_categories/1
  # DELETE /site_categories/1.json
  def destroy
    @site_category.destroy
    respond_to do |format|
      format.html { redirect_to site_categories_url, notice: 'Site category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_site_category
      @site_category = SiteCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def site_category_params
     # params.fetch(:site_category, {})
      params.require(:site_category).permit!

    end
end
