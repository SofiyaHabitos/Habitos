require 'test_helper'

class MealRestrictionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @meal_restriction = meal_restrictions(:one)
  end

  test "should get index" do
    get meal_restrictions_url
    assert_response :success
  end

  test "should get new" do
    get new_meal_restriction_url
    assert_response :success
  end

  test "should create meal_restriction" do
    assert_difference('MealRestriction.count') do
      post meal_restrictions_url, params: { meal_restriction: { created_by: @meal_restriction.created_by, meal_restriction_name: @meal_restriction.meal_restriction_name, updated_by: @meal_restriction.updated_by } }
    end

    assert_redirected_to meal_restriction_url(MealRestriction.last)
  end

  test "should show meal_restriction" do
    get meal_restriction_url(@meal_restriction)
    assert_response :success
  end

  test "should get edit" do
    get edit_meal_restriction_url(@meal_restriction)
    assert_response :success
  end

  test "should update meal_restriction" do
    patch meal_restriction_url(@meal_restriction), params: { meal_restriction: { created_by: @meal_restriction.created_by, meal_restriction_name: @meal_restriction.meal_restriction_name, updated_by: @meal_restriction.updated_by } }
    assert_redirected_to meal_restriction_url(@meal_restriction)
  end

  test "should destroy meal_restriction" do
    assert_difference('MealRestriction.count', -1) do
      delete meal_restriction_url(@meal_restriction)
    end

    assert_redirected_to meal_restrictions_url
  end
end
