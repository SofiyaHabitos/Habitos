require 'test_helper'

class KitchenUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @kitchen_user = kitchen_users(:one)
  end

  test "should get index" do
    get kitchen_users_url
    assert_response :success
  end

  test "should get new" do
    get new_kitchen_user_url
    assert_response :success
  end

  test "should create kitchen_user" do
    assert_difference('KitchenUser.count') do
      post kitchen_users_url, params: { kitchen_user: { address: @kitchen_user.address, auth_token: @kitchen_user.auth_token, created_by: @kitchen_user.created_by, email: @kitchen_user.email, kitchen_id: @kitchen_user.kitchen_id, mobile_number: @kitchen_user.mobile_number, name: @kitchen_user.name, password_digest: @kitchen_user.password_digest, updated_by: @kitchen_user.updated_by, user_name: @kitchen_user.user_name } }
    end

    assert_redirected_to kitchen_user_url(KitchenUser.last)
  end

  test "should show kitchen_user" do
    get kitchen_user_url(@kitchen_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_kitchen_user_url(@kitchen_user)
    assert_response :success
  end

  test "should update kitchen_user" do
    patch kitchen_user_url(@kitchen_user), params: { kitchen_user: { address: @kitchen_user.address, auth_token: @kitchen_user.auth_token, created_by: @kitchen_user.created_by, email: @kitchen_user.email, kitchen_id: @kitchen_user.kitchen_id, mobile_number: @kitchen_user.mobile_number, name: @kitchen_user.name, password_digest: @kitchen_user.password_digest, updated_by: @kitchen_user.updated_by, user_name: @kitchen_user.user_name } }
    assert_redirected_to kitchen_user_url(@kitchen_user)
  end

  test "should destroy kitchen_user" do
    assert_difference('KitchenUser.count', -1) do
      delete kitchen_user_url(@kitchen_user)
    end

    assert_redirected_to kitchen_users_url
  end
end
