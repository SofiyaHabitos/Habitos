require 'test_helper'

class ItemMealCoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item_meal_course = item_meal_courses(:one)
  end

  test "should get index" do
    get item_meal_courses_url
    assert_response :success
  end

  test "should get new" do
    get new_item_meal_course_url
    assert_response :success
  end

  test "should create item_meal_course" do
    assert_difference('ItemMealCourse.count') do
      post item_meal_courses_url, params: { item_meal_course: { created_by: @item_meal_course.created_by, meal_course_id: @item_meal_course.meal_course_id, production_item_id: @item_meal_course.production_item_id, updated_by: @item_meal_course.updated_by } }
    end

    assert_redirected_to item_meal_course_url(ItemMealCourse.last)
  end

  test "should show item_meal_course" do
    get item_meal_course_url(@item_meal_course)
    assert_response :success
  end

  test "should get edit" do
    get edit_item_meal_course_url(@item_meal_course)
    assert_response :success
  end

  test "should update item_meal_course" do
    patch item_meal_course_url(@item_meal_course), params: { item_meal_course: { created_by: @item_meal_course.created_by, meal_course_id: @item_meal_course.meal_course_id, production_item_id: @item_meal_course.production_item_id, updated_by: @item_meal_course.updated_by } }
    assert_redirected_to item_meal_course_url(@item_meal_course)
  end

  test "should destroy item_meal_course" do
    assert_difference('ItemMealCourse.count', -1) do
      delete item_meal_course_url(@item_meal_course)
    end

    assert_redirected_to item_meal_courses_url
  end
end
