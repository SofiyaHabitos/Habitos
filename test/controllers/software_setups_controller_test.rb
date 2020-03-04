require 'test_helper'

class SoftwareSetupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @software_setup = software_setups(:one)
  end

  test "should get index" do
    get software_setups_url
    assert_response :success
  end

  test "should get new" do
    get new_software_setup_url
    assert_response :success
  end

  test "should create software_setup" do
    assert_difference('SoftwareSetup.count') do
      post software_setups_url, params: { software_setup: {  } }
    end

    assert_redirected_to software_setup_url(SoftwareSetup.last)
  end

  test "should show software_setup" do
    get software_setup_url(@software_setup)
    assert_response :success
  end

  test "should get edit" do
    get edit_software_setup_url(@software_setup)
    assert_response :success
  end

  test "should update software_setup" do
    patch software_setup_url(@software_setup), params: { software_setup: {  } }
    assert_redirected_to software_setup_url(@software_setup)
  end

  test "should destroy software_setup" do
    assert_difference('SoftwareSetup.count', -1) do
      delete software_setup_url(@software_setup)
    end

    assert_redirected_to software_setups_url
  end
end
