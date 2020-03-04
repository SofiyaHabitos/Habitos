class MealCoursesController < ApplicationController
  before_action :set_meal_course, only: [:show, :edit, :update, :destroy]

  # GET /meal_courses
  # GET /meal_courses.json
  def index
    @meal_courses = MealCourse.all
  end

  # GET /meal_courses/1
  # GET /meal_courses/1.json
  def show
  end

  # GET /meal_courses/new
  def new
    @meal_course = MealCourse.new
  end

  # GET /meal_courses/1/edit
  def edit
  end

  # POST /meal_courses
  # POST /meal_courses.json
  def create
    already_presence = MealCourse.find_by(:position=>params[:meal_course][:position])

    latest_position = MealCourse.pluck(:position).compact.max
    if already_presence.present?
        already_presence.update(position: latest_position + 1)
    end
    
    @meal_course = MealCourse.new(meal_course_params)
    @meal_course.created_by = KitchenUser.find(session[:kitchen_user_id]).name

    respond_to do |format|
      if @meal_course.save
        format.html { redirect_to meal_courses_url, notice: 'Meal course was successfully created.' }
        format.json { render :show, status: :created, location: @meal_course }
      else
        format.html { render :new }
        format.json { render json: @meal_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meal_courses/1
  # PATCH/PUT /meal_courses/1.json
  def update
   
    @meal_course.updated_by = KitchenUser.find(session[:kitchen_user_id]).name
  
    editing_course_position = MealCourse.find(params[:id]).position 
    already_presence = MealCourse.find_by(:position=>params[:meal_course][:position])
    if already_presence.present?
        already_presence.update(position: editing_course_position)
    end   

    respond_to do |format|
      if @meal_course.update(meal_course_params)
        format.html { redirect_to meal_courses_url, notice: 'Meal course was successfully updated.' }
        format.json { render :show, status: :ok, location: @meal_course }
      else
        format.html { render :edit }
        format.json { render json: @meal_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meal_courses/1
  # DELETE /meal_courses/1.json
  def destroy
    @meal_course.destroy
    respond_to do |format|
      format.html { redirect_to meal_courses_url, notice: 'Meal course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def check_position

      verification = MealCourse.find_by(:position=>params[:position].to_i)
      if verification.present?
        if verification.id != params[:id]
          @msg = "Position already exists. Are u sure to continue?"
          render json: {"message" => @msg}
        end
      end

  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meal_course
      @meal_course = MealCourse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meal_course_params
      params.require(:meal_course).permit!#(:meal_course_name, :description, :created_by, :updated_by)
    end
end








































