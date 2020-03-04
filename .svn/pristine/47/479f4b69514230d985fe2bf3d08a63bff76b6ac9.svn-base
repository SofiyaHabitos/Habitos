require 'test_helper'

class AuditreviewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @auditreview = auditreviews(:one)
  end

  test "should get index" do
    get auditreviews_url
    assert_response :success
  end

  test "should get new" do
    get new_auditreview_url
    assert_response :success
  end

  test "should create auditreview" do
    assert_difference('Auditreview.count') do
      post auditreviews_url, params: { auditreview: {  } }
    end

    assert_redirected_to auditreview_url(Auditreview.last)
  end

  test "should show auditreview" do
    get auditreview_url(@auditreview)
    assert_response :success
  end

  test "should get edit" do
    get edit_auditreview_url(@auditreview)
    assert_response :success
  end

  test "should update auditreview" do
    patch auditreview_url(@auditreview), params: { auditreview: {  } }
    assert_redirected_to auditreview_url(@auditreview)
  end

  test "should destroy auditreview" do
    assert_difference('Auditreview.count', -1) do
      delete auditreview_url(@auditreview)
    end

    assert_redirected_to auditreviews_url
  end
end
