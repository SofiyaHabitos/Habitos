require 'test_helper'

class CustomerViewControlsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @customer_view_control = customer_view_controls(:one)
  end

  test "should get index" do
    get customer_view_controls_url
    assert_response :success
  end

  test "should get new" do
    get new_customer_view_control_url
    assert_response :success
  end

  test "should create customer_view_control" do
    assert_difference('CustomerViewControl.count') do
      post customer_view_controls_url, params: { customer_view_control: {  } }
    end

    assert_redirected_to customer_view_control_url(CustomerViewControl.last)
  end

  test "should show customer_view_control" do
    get customer_view_control_url(@customer_view_control)
    assert_response :success
  end

  test "should get edit" do
    get edit_customer_view_control_url(@customer_view_control)
    assert_response :success
  end

  test "should update customer_view_control" do
    patch customer_view_control_url(@customer_view_control), params: { customer_view_control: {  } }
    assert_redirected_to customer_view_control_url(@customer_view_control)
  end

  test "should destroy customer_view_control" do
    assert_difference('CustomerViewControl.count', -1) do
      delete customer_view_control_url(@customer_view_control)
    end

    assert_redirected_to customer_view_controls_url
  end
end
