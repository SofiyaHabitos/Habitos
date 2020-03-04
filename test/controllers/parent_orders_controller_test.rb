require 'test_helper'

class ParentOrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @parent_order = parent_orders(:one)
  end

  test "should get index" do
    get parent_orders_url
    assert_response :success
  end

  test "should get new" do
    get new_parent_order_url
    assert_response :success
  end

  test "should create parent_order" do
    assert_difference('ParentOrder.count') do
      post parent_orders_url, params: { parent_order: {  } }
    end

    assert_redirected_to parent_order_url(ParentOrder.last)
  end

  test "should show parent_order" do
    get parent_order_url(@parent_order)
    assert_response :success
  end

  test "should get edit" do
    get edit_parent_order_url(@parent_order)
    assert_response :success
  end

  test "should update parent_order" do
    patch parent_order_url(@parent_order), params: { parent_order: {  } }
    assert_redirected_to parent_order_url(@parent_order)
  end

  test "should destroy parent_order" do
    assert_difference('ParentOrder.count', -1) do
      delete parent_order_url(@parent_order)
    end

    assert_redirected_to parent_orders_url
  end
end
