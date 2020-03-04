require 'test_helper'

class TripDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @trip_detail = trip_details(:one)
  end

  test "should get index" do
    get trip_details_url
    assert_response :success
  end

  test "should get new" do
    get new_trip_detail_url
    assert_response :success
  end

  test "should create trip_detail" do
    assert_difference('TripDetail.count') do
      post trip_details_url, params: { trip_detail: { destination: @trip_detail.destination, distance: @trip_detail.distance, rate: @trip_detail.rate, serving_charging: @trip_detail.serving_charging, source: @trip_detail.source, trip_id: @trip_detail.trip_id, vehicle_type: @trip_detail.vehicle_type, waiting_charge: @trip_detail.waiting_charge, waiting_time: @trip_detail.waiting_time } }
    end

    assert_redirected_to trip_detail_url(TripDetail.last)
  end

  test "should show trip_detail" do
    get trip_detail_url(@trip_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_trip_detail_url(@trip_detail)
    assert_response :success
  end

  test "should update trip_detail" do
    patch trip_detail_url(@trip_detail), params: { trip_detail: { destination: @trip_detail.destination, distance: @trip_detail.distance, rate: @trip_detail.rate, serving_charging: @trip_detail.serving_charging, source: @trip_detail.source, trip_id: @trip_detail.trip_id, vehicle_type: @trip_detail.vehicle_type, waiting_charge: @trip_detail.waiting_charge, waiting_time: @trip_detail.waiting_time } }
    assert_redirected_to trip_detail_url(@trip_detail)
  end

  test "should destroy trip_detail" do
    assert_difference('TripDetail.count', -1) do
      delete trip_detail_url(@trip_detail)
    end

    assert_redirected_to trip_details_url
  end
end
