require 'test_helper'

class MealCoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @meal_course = meal_courses(:one)
  end

  test "should get index" do
    get meal_courses_url
    assert_response :success
  end

  test "should get new" do
    get new_meal_course_url
    assert_response :success
  end

  test "should create meal_course" do
    assert_difference('MealCourse.count') do
      post meal_courses_url, params: { meal_course: { created_by: @meal_course.created_by, description: @meal_course.description, meal_course_name: @meal_course.meal_course_name, updated_by: @meal_course.updated_by } }
    end

    assert_redirected_to meal_course_url(MealCourse.last)
  end

  test "should show meal_course" do
    get meal_course_url(@meal_course)
    assert_response :success
  end

  test "should get edit" do
    get edit_meal_course_url(@meal_course)
    assert_response :success
  end

  test "should update meal_course" do
    patch meal_course_url(@meal_course), params: { meal_course: { created_by: @meal_course.created_by, description: @meal_course.description, meal_course_name: @meal_course.meal_course_name, updated_by: @meal_course.updated_by } }
    assert_redirected_to meal_course_url(@meal_course)
  end

  test "should destroy meal_course" do
    assert_difference('MealCourse.count', -1) do
      delete meal_course_url(@meal_course)
    end

    assert_redirected_to meal_courses_url
  end
end
