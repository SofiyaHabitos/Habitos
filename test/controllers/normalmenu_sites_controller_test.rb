require 'test_helper'

class NormalmenuSitesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @normalmenu_site = normalmenu_sites(:one)
  end

  test "should get index" do
    get normalmenu_sites_url
    assert_response :success
  end

  test "should get new" do
    get new_normalmenu_site_url
    assert_response :success
  end

  test "should create normalmenu_site" do
    assert_difference('NormalmenuSite.count') do
      post normalmenu_sites_url, params: { normalmenu_site: {  } }
    end

    assert_redirected_to normalmenu_site_url(NormalmenuSite.last)
  end

  test "should show normalmenu_site" do
    get normalmenu_site_url(@normalmenu_site)
    assert_response :success
  end

  test "should get edit" do
    get edit_normalmenu_site_url(@normalmenu_site)
    assert_response :success
  end

  test "should update normalmenu_site" do
    patch normalmenu_site_url(@normalmenu_site), params: { normalmenu_site: {  } }
    assert_redirected_to normalmenu_site_url(@normalmenu_site)
  end

  test "should destroy normalmenu_site" do
    assert_difference('NormalmenuSite.count', -1) do
      delete normalmenu_site_url(@normalmenu_site)
    end

    assert_redirected_to normalmenu_sites_url
  end
end
