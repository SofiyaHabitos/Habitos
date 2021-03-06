class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  #before_action :set_permission, :only => [:create,:show, :edit, :update, :destroy]
  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.all.order(:position)
    # @categories = Category.paginate(:page => params[:page], :per_page => 10)
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        @category.update(:created_by=>session[:kitchen_user_id])
        format.html { redirect_to action: "index", notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        @category.update(:updated_by=>session[:kitchen_user_id])
        format.html { redirect_to action: "index", notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def check_position
      category = Category.find_by(:position=>params[:position].to_i)
      if category.present?
        if category.id != params[:id]
          @msg = "Position already exists. Are you sure to continue?"
          render json: {"message" => @msg}
        end
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
       unless params[:id] == "undefined"
      @category = Category.find(params[:id])
    else
     redirect_to action: "index"
    end
    end
   
    # def set_permission
    #   #byebug
    #  @data =  KitchenUser.find(session["kitchen_user_id"]).role.name == "superadmin"   
     
    # end 
   
    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:category_name, :description, :position)
    end
end
