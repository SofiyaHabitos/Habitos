require 'test_helper'

class ProductionCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @production_category = production_categories(:one)
  end

  test "should get index" do
    get production_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_production_category_url
    assert_response :success
  end

  test "should create production_category" do
    assert_difference('ProductionCategory.count') do
      post production_categories_url, params: { production_category: {  } }
    end

    assert_redirected_to production_category_url(ProductionCategory.last)
  end

  test "should show production_category" do
    get production_category_url(@production_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_production_category_url(@production_category)
    assert_response :success
  end

  test "should update production_category" do
    patch production_category_url(@production_category), params: { production_category: {  } }
    assert_redirected_to production_category_url(@production_category)
  end

  test "should destroy production_category" do
    assert_difference('ProductionCategory.count', -1) do
      delete production_category_url(@production_category)
    end

    assert_redirected_to production_categories_url
  end
end
