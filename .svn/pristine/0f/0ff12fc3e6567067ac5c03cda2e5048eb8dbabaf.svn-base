class FoodGroupsController < ApplicationController
  before_action :set_food_group, only: [:show, :edit, :update, :destroy, :image_pop]

  # GET /food_groups
  # GET /food_groups.json
  def index
    @food_groups = FoodGroup.all
    #@food_groups = FoodGroup.paginate(:page => params[:page], :per_page => 10)
  end

  # GET /food_groups/1
  # GET /food_groups/1.json
  def show
  end

  # GET /food_groups/new
  def new
    @food_group = FoodGroup.new
   @food_group.build_image
  end

  # GET /food_groups/1/edit
  def edit
  end

   def image_pop
    @food_image = @food_group.image.image_path
    @food_group_image = @food_group.image.image_path.to_s.split("/").last
   end


  # POST /food_groups
  # POST /food_groups.json
  def create
    
    @food_group = FoodGroup.new(food_group_params)
    respond_to do |format|
       if @food_group.save
        @food_group.update(:created_by=>session[:kitchen_user_id])
        format.html { redirect_to action: "index", notice: 'Food group was successfully created.' }
        format.json { render :show, status: :created, location: @food_group }
      else
        format.html { render :new }
        format.json { render json: @food_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /food_groups/1
  # PATCH/PUT /food_groups/1.json
  def update
    respond_to do |format|
      old_image_id=@food_group.image_id
      #if params[:food_group][:image_attributes][:image_path] == nil
      if @food_group.update(food_group_params)
        #byebug
        if  params[:food_group][:image_attributes][:image_path] == nil
          @food_group.update(:image_id=>old_image_id)
        end
        @food_group.update(:updated_by=>session[:kitchen_user_id])
        format.html { redirect_to action: "index", notice: 'Food group was successfully updated.' }
        format.json { render :show, status: :ok, location: @food_group }
      else
        format.html { render :edit }
        format.json { render json: @food_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /food_groups/1
  # DELETE /food_groups/1.json
  def destroy
    @food_group.destroy
    respond_to do |format|
      format.html { redirect_to food_groups_url, notice: 'Food group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food_group
        unless params[:id] == "undefined"
     @food_group = FoodGroup.find(params[:id])
    else
     redirect_to action: "index"
    end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def food_group_params
      params.require(:food_group).permit(:meal_time, :food_category_id, :description, :image_id, :created_by, :updated_by,image_attributes: [:image_path])
    end
end
