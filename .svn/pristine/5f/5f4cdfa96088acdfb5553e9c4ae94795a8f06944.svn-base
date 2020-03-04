require 'test_helper'

class MenuCustomersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @menu_customer = menu_customers(:one)
  end

  test "should get index" do
    get menu_customers_url
    assert_response :success
  end

  test "should get new" do
    get new_menu_customer_url
    assert_response :success
  end

  test "should create menu_customer" do
    assert_difference('MenuCustomer.count') do
      post menu_customers_url, params: { menu_customer: { category_id: @menu_customer.category_id, created_by: @menu_customer.created_by, date: @menu_customer.date, menu_master_id: @menu_customer.menu_master_id, tenant_id: @menu_customer.tenant_id, updated_by: @menu_customer.updated_by } }
    end

    assert_redirected_to menu_customer_url(MenuCustomer.last)
  end

  test "should show menu_customer" do
    get menu_customer_url(@menu_customer)
    assert_response :success
  end

  test "should get edit" do
    get edit_menu_customer_url(@menu_customer)
    assert_response :success
  end

  test "should update menu_customer" do
    patch menu_customer_url(@menu_customer), params: { menu_customer: { category_id: @menu_customer.category_id, created_by: @menu_customer.created_by, date: @menu_customer.date, menu_master_id: @menu_customer.menu_master_id, tenant_id: @menu_customer.tenant_id, updated_by: @menu_customer.updated_by } }
    assert_redirected_to menu_customer_url(@menu_customer)
  end

  test "should destroy menu_customer" do
    assert_difference('MenuCustomer.count', -1) do
      delete menu_customer_url(@menu_customer)
    end

    assert_redirected_to menu_customers_url
  end
end
