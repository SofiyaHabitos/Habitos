require 'test_helper'

class NormalMenusControllerTest < ActionDispatch::IntegrationTest
  setup do
    @normal_menu = normal_menus(:one)
  end

  test "should get index" do
    get normal_menus_url
    assert_response :success
  end

  test "should get new" do
    get new_normal_menu_url
    assert_response :success
  end

  test "should create normal_menu" do
    assert_difference('NormalMenu.count') do
      post normal_menus_url, params: { normal_menu: {  } }
    end

    assert_redirected_to normal_menu_url(NormalMenu.last)
  end

  test "should show normal_menu" do
    get normal_menu_url(@normal_menu)
    assert_response :success
  end

  test "should get edit" do
    get edit_normal_menu_url(@normal_menu)
    assert_response :success
  end

  test "should update normal_menu" do
    patch normal_menu_url(@normal_menu), params: { normal_menu: {  } }
    assert_redirected_to normal_menu_url(@normal_menu)
  end

  test "should destroy normal_menu" do
    assert_difference('NormalMenu.count', -1) do
      delete normal_menu_url(@normal_menu)
    end

    assert_redirected_to normal_menus_url
  end
end
