require 'test_helper'

class AlleriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @allery = alleries(:one)
  end

  test "should get index" do
    get alleries_url
    assert_response :success
  end

  test "should get new" do
    get new_allery_url
    assert_response :success
  end

  test "should create allery" do
    assert_difference('Allery.count') do
      post alleries_url, params: { allery: { description: @allery.description, name: @allery.name } }
    end

    assert_redirected_to allery_url(Allery.last)
  end

  test "should show allery" do
    get allery_url(@allery)
    assert_response :success
  end

  test "should get edit" do
    get edit_allery_url(@allery)
    assert_response :success
  end

  test "should update allery" do
    patch allery_url(@allery), params: { allery: { description: @allery.description, name: @allery.name } }
    assert_redirected_to allery_url(@allery)
  end

  test "should destroy allery" do
    assert_difference('Allery.count', -1) do
      delete allery_url(@allery)
    end

    assert_redirected_to alleries_url
  end
end
