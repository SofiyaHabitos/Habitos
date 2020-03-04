require 'test_helper'

class ProductionItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @production_item = production_items(:one)
  end

  test "should get index" do
    get production_items_url
    assert_response :success
  end

  test "should get new" do
    get new_production_item_url
    assert_response :success
  end

  test "should create production_item" do
    assert_difference('ProductionItem.count') do
      post production_items_url, params: { production_item: {  } }
    end

    assert_redirected_to production_item_url(ProductionItem.last)
  end

  test "should show production_item" do
    get production_item_url(@production_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_production_item_url(@production_item)
    assert_response :success
  end

  test "should update production_item" do
    patch production_item_url(@production_item), params: { production_item: {  } }
    assert_redirected_to production_item_url(@production_item)
  end

  test "should destroy production_item" do
    assert_difference('ProductionItem.count', -1) do
      delete production_item_url(@production_item)
    end

    assert_redirected_to production_items_url
  end
end
