require 'test_helper'

class ItemSubcategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item_subcategory = item_subcategories(:one)
  end

  test "should get index" do
    get item_subcategories_url
    assert_response :success
  end

  test "should get new" do
    get new_item_subcategory_url
    assert_response :success
  end

  test "should create item_subcategory" do
    assert_difference('ItemSubcategory.count') do
      post item_subcategories_url, params: { item_subcategory: { created_by: @item_subcategory.created_by, description: @item_subcategory.description, name: @item_subcategory.name, updated_by: @item_subcategory.updated_by } }
    end

    assert_redirected_to item_subcategory_url(ItemSubcategory.last)
  end

  test "should show item_subcategory" do
    get item_subcategory_url(@item_subcategory)
    assert_response :success
  end

  test "should get edit" do
    get edit_item_subcategory_url(@item_subcategory)
    assert_response :success
  end

  test "should update item_subcategory" do
    patch item_subcategory_url(@item_subcategory), params: { item_subcategory: { created_by: @item_subcategory.created_by, description: @item_subcategory.description, name: @item_subcategory.name, updated_by: @item_subcategory.updated_by } }
    assert_redirected_to item_subcategory_url(@item_subcategory)
  end

  test "should destroy item_subcategory" do
    assert_difference('ItemSubcategory.count', -1) do
      delete item_subcategory_url(@item_subcategory)
    end

    assert_redirected_to item_subcategories_url
  end
end
