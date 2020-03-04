require 'test_helper'

class UtensilsCountMappingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @utensils_count_mapping = utensils_count_mappings(:one)
  end

  test "should get index" do
    get utensils_count_mappings_url
    assert_response :success
  end

  test "should get new" do
    get new_utensils_count_mapping_url
    assert_response :success
  end

  test "should create utensils_count_mapping" do
    assert_difference('UtensilsCountMapping.count') do
      post utensils_count_mappings_url, params: { utensils_count_mapping: {  } }
    end

    assert_redirected_to utensils_count_mapping_url(UtensilsCountMapping.last)
  end

  test "should show utensils_count_mapping" do
    get utensils_count_mapping_url(@utensils_count_mapping)
    assert_response :success
  end

  test "should get edit" do
    get edit_utensils_count_mapping_url(@utensils_count_mapping)
    assert_response :success
  end

  test "should update utensils_count_mapping" do
    patch utensils_count_mapping_url(@utensils_count_mapping), params: { utensils_count_mapping: {  } }
    assert_redirected_to utensils_count_mapping_url(@utensils_count_mapping)
  end

  test "should destroy utensils_count_mapping" do
    assert_difference('UtensilsCountMapping.count', -1) do
      delete utensils_count_mapping_url(@utensils_count_mapping)
    end

    assert_redirected_to utensils_count_mappings_url
  end
end
