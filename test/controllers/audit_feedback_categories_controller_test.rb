require 'test_helper'

class AuditFeedbackCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @audit_feedback_category = audit_feedback_categories(:one)
  end

  test "should get index" do
    get audit_feedback_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_audit_feedback_category_url
    assert_response :success
  end

  test "should create audit_feedback_category" do
    assert_difference('AuditFeedbackCategory.count') do
      post audit_feedback_categories_url, params: { audit_feedback_category: { category_desc: @audit_feedback_category.category_desc, category_name: @audit_feedback_category.category_name, status: @audit_feedback_category.status } }
    end

    assert_redirected_to audit_feedback_category_url(AuditFeedbackCategory.last)
  end

  test "should show audit_feedback_category" do
    get audit_feedback_category_url(@audit_feedback_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_audit_feedback_category_url(@audit_feedback_category)
    assert_response :success
  end

  test "should update audit_feedback_category" do
    patch audit_feedback_category_url(@audit_feedback_category), params: { audit_feedback_category: { category_desc: @audit_feedback_category.category_desc, category_name: @audit_feedback_category.category_name, status: @audit_feedback_category.status } }
    assert_redirected_to audit_feedback_category_url(@audit_feedback_category)
  end

  test "should destroy audit_feedback_category" do
    assert_difference('AuditFeedbackCategory.count', -1) do
      delete audit_feedback_category_url(@audit_feedback_category)
    end

    assert_redirected_to audit_feedback_categories_url
  end
end
