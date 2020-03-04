class ItemMealCoursesController < ApplicationController
  before_action :set_item_meal_course, only: [:show, :edit, :update, :destroy]

  # GET /item_meal_courses
  # GET /item_meal_courses.json
  def index
    @item_meal_courses = ItemMealCourse.all
  end

  # GET /item_meal_courses/1
  # GET /item_meal_courses/1.json
  def show
  end

  # GET /item_meal_courses/new
  def new
    @item_meal_course = ItemMealCourse.new
  end

  # GET /item_meal_courses/1/edit
  def edit
  end

  # POST /item_meal_courses
  # POST /item_meal_courses.json
  def create
    @item_meal_course = ItemMealCourse.new(item_meal_course_params)

    respond_to do |format|
      if @item_meal_course.save
        format.html { redirect_to @item_meal_course, notice: 'Item meal course was successfully created.' }
        format.json { render :show, status: :created, location: @item_meal_course }
      else
        format.html { render :new }
        format.json { render json: @item_meal_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /item_meal_courses/1
  # PATCH/PUT /item_meal_courses/1.json
  def update
    respond_to do |format|
      if @item_meal_course.update(item_meal_course_params)
        format.html { redirect_to @item_meal_course, notice: 'Item meal course was successfully updated.' }
        format.json { render :show, status: :ok, location: @item_meal_course }
      else
        format.html { render :edit }
        format.json { render json: @item_meal_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_meal_courses/1
  # DELETE /item_meal_courses/1.json
  def destroy
    @item_meal_course.destroy
    respond_to do |format|
      format.html { redirect_to item_meal_courses_url, notice: 'Item meal course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_meal_course
      @item_meal_course = ItemMealCourse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_meal_course_params
      params.require(:item_meal_course).permit(:production_item_id, :meal_course_id, :created_by, :updated_by)
    end
end
