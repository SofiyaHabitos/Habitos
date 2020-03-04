require 'test_helper'

class TripplansControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tripplans_index_url
    assert_response :success
  end

  test "should get new" do
    get tripplans_new_url
    assert_response :success
  end

  test "should get edit" do
    get tripplans_edit_url
    assert_response :success
  end

end
