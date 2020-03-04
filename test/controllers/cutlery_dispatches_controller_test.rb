require 'test_helper'

class CutleryDispatchesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cutlery_dispatch = cutlery_dispatches(:one)
  end

  test "should get index" do
    get cutlery_dispatches_url
    assert_response :success
  end

  test "should get new" do
    get new_cutlery_dispatch_url
    assert_response :success
  end

  test "should create cutlery_dispatch" do
    assert_difference('CutleryDispatche.count') do
      post cutlery_dispatches_url, params: { cutlery_dispatch: {  } }
    end

    assert_redirected_to cutlery_dispatch_url(CutleryDispatche.last)
  end

  test "should show cutlery_dispatch" do
    get cutlery_dispatch_url(@cutlery_dispatch)
    assert_response :success
  end

  test "should get edit" do
    get edit_cutlery_dispatch_url(@cutlery_dispatch)
    assert_response :success
  end

  test "should update cutlery_dispatch" do
    patch cutlery_dispatch_url(@cutlery_dispatch), params: { cutlery_dispatch: {  } }
    assert_redirected_to cutlery_dispatch_url(@cutlery_dispatch)
  end

  test "should destroy cutlery_dispatch" do
    assert_difference('CutleryDispatche.count', -1) do
      delete cutlery_dispatch_url(@cutlery_dispatch)
    end

    assert_redirected_to cutlery_dispatches_url
  end
end
