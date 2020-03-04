require 'test_helper'

class MenuProductionItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @menu_production_item = menu_production_items(:one)
  end

  test "should get index" do
    get menu_production_items_url
    assert_response :success
  end

  test "should get new" do
    get new_menu_production_item_url
    assert_response :success
  end

  test "should create menu_production_item" do
    assert_difference('MenuProductionItem.count') do
      post menu_production_items_url, params: { menu_production_item: { meal_course_id: @menu_production_item.meal_course_id, menu_master_id: @menu_production_item.menu_master_id, production_item_id: @menu_production_item.production_item_id, quantity: @menu_production_item.quantity } }
    end

    assert_redirected_to menu_production_item_url(MenuProductionItem.last)
  end

  test "should show menu_production_item" do
    get menu_production_item_url(@menu_production_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_menu_production_item_url(@menu_production_item)
    assert_response :success
  end

  test "should update menu_production_item" do
    patch menu_production_item_url(@menu_production_item), params: { menu_production_item: { meal_course_id: @menu_production_item.meal_course_id, menu_master_id: @menu_production_item.menu_master_id, production_item_id: @menu_production_item.production_item_id, quantity: @menu_production_item.quantity } }
    assert_redirected_to menu_production_item_url(@menu_production_item)
  end

  test "should destroy menu_production_item" do
    assert_difference('MenuProductionItem.count', -1) do
      delete menu_production_item_url(@menu_production_item)
    end

    assert_redirected_to menu_production_items_url
  end
end
