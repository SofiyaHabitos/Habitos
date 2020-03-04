class TripplansController < ApplicationController
  def index
  end

  def new
  
     @category = Category.all.order(:position)
     @tenant = MenuCycle.where(date: params["val"])
  end

  def edit
  end

  def trip_plan
    
   
  # @drivers = Driver.all.pluck(:driver_name,:id)
  # @trip_name = Trip.all.pluck(:trip_name,:id)
  # @tenant = MenuCycle.where(date: params["val"])
  
  end

  def vessel_delivery
  end

  def tookan_detail
  end

  def trip_show
  end

end
