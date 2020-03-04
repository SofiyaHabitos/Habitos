require 'test_helper'

class DispatchUtensilsMappingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dispatch_utensils_mapping = dispatch_utensils_mappings(:one)
  end

  test "should get index" do
    get dispatch_utensils_mappings_url
    assert_response :success
  end

  test "should get new" do
    get new_dispatch_utensils_mapping_url
    assert_response :success
  end

  test "should create dispatch_utensils_mapping" do
    assert_difference('DispatchUtensilsMapping.count') do
      post dispatch_utensils_mappings_url, params: { dispatch_utensils_mapping: {  } }
    end

    assert_redirected_to dispatch_utensils_mapping_url(DispatchUtensilsMapping.last)
  end

  test "should show dispatch_utensils_mapping" do
    get dispatch_utensils_mapping_url(@dispatch_utensils_mapping)
    assert_response :success
  end

  test "should get edit" do
    get edit_dispatch_utensils_mapping_url(@dispatch_utensils_mapping)
    assert_response :success
  end

  test "should update dispatch_utensils_mapping" do
    patch dispatch_utensils_mapping_url(@dispatch_utensils_mapping), params: { dispatch_utensils_mapping: {  } }
    assert_redirected_to dispatch_utensils_mapping_url(@dispatch_utensils_mapping)
  end

  test "should destroy dispatch_utensils_mapping" do
    assert_difference('DispatchUtensilsMapping.count', -1) do
      delete dispatch_utensils_mapping_url(@dispatch_utensils_mapping)
    end

    assert_redirected_to dispatch_utensils_mappings_url
  end
end
