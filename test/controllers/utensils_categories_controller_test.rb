require 'test_helper'

class UtensilsCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @utensils_category = utensils_categories(:one)
  end

  test "should get index" do
    get utensils_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_utensils_category_url
    assert_response :success
  end

  test "should create utensils_category" do
    assert_difference('UtensilsCategory.count') do
      post utensils_categories_url, params: { utensils_category: {  } }
    end

    assert_redirected_to utensils_category_url(UtensilsCategory.last)
  end

  test "should show utensils_category" do
    get utensils_category_url(@utensils_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_utensils_category_url(@utensils_category)
    assert_response :success
  end

  test "should update utensils_category" do
    patch utensils_category_url(@utensils_category), params: { utensils_category: {  } }
    assert_redirected_to utensils_category_url(@utensils_category)
  end

  test "should destroy utensils_category" do
    assert_difference('UtensilsCategory.count', -1) do
      delete utensils_category_url(@utensils_category)
    end

    assert_redirected_to utensils_categories_url
  end
end
