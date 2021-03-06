class ItemSubcategoriesController < ApplicationController
  before_action :set_item_subcategory, only: [:show, :edit, :update, :destroy]
 

  # GET /item_subcategories
  # GET /item_subcategories.json
  def index
    #@item_subcategories = ItemSubcategory.all


    #Get API from Product information management
    @category_list = ItemSubcategory.get_category
   



  end

  # GET /item_subcategories/1
  # GET /item_subcategories/1.json
  def show
  end

  # GET /item_subcategories/new
  def new
    @item_subcategory = ItemSubcategory.new
  end

  # GET /item_subcategories/1/edit
  def edit
  end

  # POST /item_subcategories
  # POST /item_subcategories.json
  def create
    @item_subcategory = ItemSubcategory.new(item_subcategory_params)

    respond_to do |format|
      if @item_subcategory.save
        @item_subcategory.update(:create_by=>session[:kitchen_user_id])
        format.html { redirect_to item_subcategories_url, notice: 'Item subcategory was successfully created.' }
        format.json { render :show, status: :created, location: @item_subcategory }
      else
        format.html { render :new }
        format.json { render json: @item_subcategory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /item_subcategories/1
  # PATCH/PUT /item_subcategories/1.json
  def update
    respond_to do |format|
      if @item_subcategory.update(item_subcategory_params)
        @item_subcategory.update(:updated_by=>session[:kitchen_user_id])
        format.html { redirect_to item_subcategories_url, notice: 'Item subcategory was successfully updated.' }
        format.json { render :show, status: :ok, location: @item_subcategory }
      else
        format.html { render :edit }
        format.json { render json: @item_subcategory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_subcategories/1
  # DELETE /item_subcategories/1.json
  def destroy
    @item_subcategory.destroy
    respond_to do |format|
      format.html { redirect_to item_subcategories_url, notice: 'Item subcategory was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_subcategory
      @item_subcategory = ItemSubcategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_subcategory_params
      params.require(:item_subcategory).permit(:name, :description, :created_by, :updated_by)
    end
end
