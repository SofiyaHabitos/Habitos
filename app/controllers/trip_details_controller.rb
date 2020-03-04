class TripDetailsController < ApplicationController
  #before_action :set_trip_detail, only: [:show, :edit, :update, :destroy]

  # GET /trip_details
  # GET /trip_details.json
  def index
    @trips = Trip.all.includes(:trip_details)
  end

  # GET /trip_details/1
  # GET /trip_details/1.json
  def show
    @trip = Trip.find(params[:id])
    @trip_details = @trip.trip_details
  end

  # GET /trip_details/new
  def new

    @trip = Trip.new
    @trip.trip_details.build
    @trip_detail=TripDetail.new 

 end

  # GET /trip_details/1/edit
  def edit
    @trip = Trip.find(params[:id])
    @trip_detail = @trip.trip_details
  end




def create1


end
  # POST /trip_details
  # POST /trip_details.json
  def create
    
    params["trip"]["trip_details_attributes"].values.map{|i| i["waiting_time"] = "#{i["hours"]+":"+i["mins"]}"}    
    @trip_detail = Trip.new(trip_detail_params)
    respond_to do |format|
      if @trip_detail.save
        @trip_detail.update(report_time: params["trip"]["report_time"])
        #order_id = TripDetail.last.order_id.present? ? TripDetail.last.order_id.to_i + 1 : "000001".to_i
        #@trip_detail.update(order_id: order_id)
      
       distance_sum = @trip_detail.trip_details.pluck(:distance).sum

       @trip_detail.trip_details.each do |ind|
        order_id = TripDetail.pluck(:order_id).map(&:to_i).max.present? ? TripDetail.pluck(:order_id).map(&:to_i).max + 1 : "000001".to_i
        ind.update(order_id: order_id)
      end

#ff
       amount = @trip_detail.trip_details.pluck(:distance,:waiting_charge,:serving_charging)

       distance = @trip_detail.trip_details.pluck(:distance).map(&:to_f)
       rate = @trip_detail.trip_details.pluck(:rate).map(&:to_f)
#dff

       amount.each_with_index{|a,index| 
        a[0]=a[0].to_f*rate[index]
        a[1] = a[1].to_f
        a[2]= a[2].to_f
      }
       trip_amount = amount.flatten.sum

        #trip_amount = distance.zip(rate).map{|x, y| x * y}.sum
       @trip_detail.update(trip_distance: distance_sum,trip_cost: trip_amount)
        format.html { redirect_to trip_details_path, notice: 'Trip detail was successfully created.' }
        format.json { render :show, status: :created, location: @trip_detail }
      else
        format.html { render :new}
        format.json { render json: @trip_detail.errors, status: :unprocessable_entity }
      end
    end
  end
 
  # PATCH/PUT /trip_details/1
  # PATCH/PUT /trip_details/1.json
  def update
      
      respond_to do |format|

      if @trip_detail.update(trip_detail_params)
        
        format.html { redirect_to @trip_detail, notice: 'Trip detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @trip_detail }
      else
        format.html { render :edit }
        format.json { render json: @trip_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # Check the Trip Name Already Exists

  def check_plan_name_present
    if Trip.find_by(:trip_name =>(params[:plan_name_id])).present?
      msg = "Trip Name already Exists"
    else
      msg = ""
    end
    render json: {"message"=> msg}
  end

  def tripdetail_update

    @trip = Trip.find(params[:id])
    @trip.update(report_time:  params["trip"]["report_time"])
    params["trip"]["trip_details_attributes"].values.map{|i| i["waiting_time"] = "#{i["hours"]+":"+i["mins"]}"}     
      respond_to do |format|
      if @trip.update(trip_detail_params)
        distance = @trip.trip_details.pluck(:distance).sum
        amount = @trip.trip_details.pluck(:distance,:waiting_charge,:serving_charging)
        rate = @trip.trip_details.pluck(:rate)
        amount.each_with_index{|a,index|   a[0]=a[0].to_f*rate[index]
        a[1] = a[1].to_f
        a[2]= a[2].to_f}
        trip_amount = amount.flatten.sum
        @trip.update(trip_distance: distance,trip_cost: trip_amount)
        format.html { redirect_to trip_details_path, notice: 'Trip detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @trip_details }
      else
        format.html { render :edit }
        format.json { render json: @trip_detail.errors, status: :unprocessable_entity }
      end
    end

  end

  # DELETE /trip_details/1
  # DELETE /trip_details/1.json
  def destroy
    @trip_detail.destroy
    respond_to do |format|
      format.html { redirect_to trip_details_url, notice: 'Trip detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip_detail
      @trip_detail = Trip.find(params[:id])
    end



    # Never trust parameters from the scary internet, only allow the white list through.
    def trip_detail_params
      params.require(:trip).permit(:trip_name,:_destroy,:id,:vehicle_type_id, trip_details_attributes: [:source, :destination, :vehicle_type, :distance, :rate, :waiting_time, :waiting_charge, :serving_charging, :trip_id,:id, :hours, :mins, :trip_type])
    end
end
