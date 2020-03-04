require 'test_helper'

class ItemMealRestrictionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item_meal_restriction = item_meal_restrictions(:one)
  end

  test "should get index" do
    get item_meal_restrictions_url
    assert_response :success
  end

  test "should get new" do
    get new_item_meal_restriction_url
    assert_response :success
  end

  test "should create item_meal_restriction" do
    assert_difference('ItemMealRestriction.count') do
      post item_meal_restrictions_url, params: { item_meal_restriction: { created_by: @item_meal_restriction.created_by, meal_restriction_id: @item_meal_restriction.meal_restriction_id, production_item_id: @item_meal_restriction.production_item_id, updated_by: @item_meal_restriction.updated_by } }
    end

    assert_redirected_to item_meal_restriction_url(ItemMealRestriction.last)
  end

  test "should show item_meal_restriction" do
    get item_meal_restriction_url(@item_meal_restriction)
    assert_response :success
  end

  test "should get edit" do
    get edit_item_meal_restriction_url(@item_meal_restriction)
    assert_response :success
  end

  test "should update item_meal_restriction" do
    patch item_meal_restriction_url(@item_meal_restriction), params: { item_meal_restriction: { created_by: @item_meal_restriction.created_by, meal_restriction_id: @item_meal_restriction.meal_restriction_id, production_item_id: @item_meal_restriction.production_item_id, updated_by: @item_meal_restriction.updated_by } }
    assert_redirected_to item_meal_restriction_url(@item_meal_restriction)
  end

  test "should destroy item_meal_restriction" do
    assert_difference('ItemMealRestriction.count', -1) do
      delete item_meal_restriction_url(@item_meal_restriction)
    end

    assert_redirected_to item_meal_restrictions_url
  end
end
