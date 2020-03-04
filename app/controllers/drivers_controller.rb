class DriversController < ApplicationController
  before_action :set_driver, only: [:show, :edit, :update, :destroy]

  # GET /drivers
  # GET /drivers.json
  def index
    @drivers = Driver.all
  end

  # GET /drivers/1
  # GET /drivers/1.json
  def show
  end

  # GET /drivers/new
  def new
    @driver = Driver.new
  end

  # GET /drivers/1/edit
  def edit
  end

  # POST /drivers
  # POST /drivers.json
  # def create1
    
  #   @driver = Driver.new(driver_params)
  #   respond_to do |format|
  #     if @driver.save
  #       format.html { redirect_to drivers_path, notice: 'Driver was successfully created.' }
  #       format.json { render :show, status: :created, location: @driver }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @driver.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end


  # def create1
    
  #   data = driver_params
  #   tookan = {"api_key": "50676980f6400e431b177b784b5425431be0c0fa2fdc7b365a1e04","email": data[:email], "phone": data[:contact_no], "transport_type": "1", "transport_desc": data[:vehicle_type], "license": data[:licence_no], "color": data[:color], "timezone": "+530", "team_id": "258914", "password": data[:password], "username": data[:username], "first_name": data[:driver_name], "last_name": data[:last_name], "rule_id": "66845" }

  #     response = RestClient.post "https://api.tookanapp.com/v2/add_agent", tookan.to_json, :content_type => "application/json"
  #     response = JSON.parse(response)
  #     if response["status"] == 200
  #      @driver = Driver.new(data)
  #      @driver.save
  #      @driver.update(fleet_id: response["data"]["fleet_id"],timezone: "+530", team_id: "249610",role_id: "63852",vehicle_desc: data[:vehicle_type])
  #       respond_to do |format|
  #        format.html { redirect_to drivers_path, notice: 'Driver was successfully created.' }
  #        format.json { render :show, status: :created, location: @driver }
  #       end
  #     else
  #       respond_to do |format|
  #        format.html { render :new }
  #        format.json { render json: @driver.errors, status: :unprocessable_entity }
  #       end
  #     end
  # end

  def create
    data = driver_params
    tookan = {"api_key": "50646180f541481e4c422b614c5825431be3c2f82fd57936541c03", "phone": data[:contact_no], "transport_type": "1","timezone": "+530", "team_id": "280635", "password": data[:password], "username": data[:username], "first_name": data[:driver_name], "rule_id": "73974" }
      response = RestClient.post "https://api.tookanapp.com/v2/add_agent", tookan.to_json, :content_type => "application/json"
      response = JSON.parse(response)     
      @driver = Driver.new(data)
       respond_to do |format|
      if response["status"] == 200
        @driver.save
        @driver.update(fleet_id: response["data"]["fleet_id"], team_id: "280635",role_id: "73974")
        # format.html { redirect_to @vehicle, notice: 'Vehicle was successfully created.' }
        format.html { redirect_to drivers_path }
        format.json { render :show, status: :created, location: @driver }
       else
        format.html { render :new }
        format.json { render json: @driver, status: :unprocessable_entity }
      end
    end
   end
  #end

  # PATCH/PUT /drivers/1
  # PATCH/PUT /drivers/1.json
  def update
    data = driver_params
    tookan = {"api_key": "50646180f541481e4c422b614c5825431be3c2f82fd57936541c03","fleet_id": @driver.fleet_id,"phone": data[:contact_no], "password": data[:password], "username": data[:username], "first_name": data[:driver_name] }
    response = RestClient.post "https://api.tookanapp.com/v2/edit_agent", tookan.to_json, :content_type => "application/json"
      response = JSON.parse(response)
      if response["status"] == 200
       respond_to do |format|
        if @driver.update(driver_params)
          format.html { redirect_to drivers_path }
          #format.html { redirect_to drivers_path, notice: 'Driver was successfully updated.' }
          format.json { render :show, status: :ok, location: @driver }
         else
          format.html { render :edit }
          format.json { render json: @driver.errors, status: :unprocessable_entity }
        end
       end
      end
  end


  def driver_start1
    TripAssignment.where("job_id->>'pickup' = '62667911'")

  end

  # def update1
  #   data = driver_params
  #   tookan = {"api_key": "50676980f6400e431b177b784b5425431be0c0fa2fdc7b365a1e04","fleet_id": @driver.fleet_id,"email": data[:email], "phone": data[:contact_no], "transport_type": "1", "transport_desc": data[:vehicle_type], "license": data[:licence_no], "color": data[:color], "timezone": "+530", "team_id": "258914", "password": data[:password], "username": data[:username], "first_name": data[:driver_name], "last_name": data[:last_name], "rule_id": "66845" }
  #     response = RestClient.post "https://api.tookanapp.com/v2/edit_agent", tookan.to_json, :content_type => "application/json"
  #     response = JSON.parse(response)
  #     if response["status"] == 200
  #      @driver.update(driver_params) 
  #   respond_to do |format|
  #     #format.html { redirect_to drivers_path, notice: 'Driver was successfully updated.' }
  #     format.html { redirect_to drivers_path }
  #     format.json { render :show, status: :ok, location: @driver }
  #   end
  #     else
  #     respond_to do |format|
  #      format.html { render :edit }
  #      format.json { render json: @driver.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /drivers/1
  # DELETE /drivers/1.json
  def destroy
    tookan = {"api_key": "50646180f541481e4c422b614c5825431be3c2f82fd57936541c03", "fleet_id": @driver.fleet_id}
    response = RestClient.post "https://api.tookanapp.com/v2/delete_fleet_account", tookan.to_json, :content_type => "application/json"
      response = JSON.parse(response)
      if response["status"] == 200
    @driver.destroy
    respond_to do |format|
      format.html { redirect_to drivers_url, notice: 'Driver was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
end


  def check_driver_present 
    if Driver.find_by(:username=>(params[:username])).present?
      msgg = "Username already Exists"
    else
      msgg = ""
    end
    render json: {"message"=> msgg}
  end

  def check_driver_email_present
    if Driver.find_by(:email=>(params[:email])).present?
      msg = "Email already Exists"
    else
      msg = ""
    end
    render json: {"message"=> msg}
  end

 def check_vehicle_register_present
    if Vehicle.find_by(:reg_no=>(params[:register])).present?
      msg = "Register Number already Exists"
    else
      msg = ""
    end
    render json: {"message"=> msg}
  end


  def driver_start
   #logger.info(params)
   data  = params
   job_id = data["job_id"]
   TripAssignment.where("job_id->>'pickup' = '#{job_id}'").update_all(pickup_count: data["custom_fields"].first["data"],actual_pickup: data["started_datetime_formatted"].to_datetime.strftime("%I:%M%p"))
  end

  def driver_delivered
   data = params
   job_id = data["job_id"]
   TripAssignment.where("job_id->>'delivery' = '#{job_id}'").update_all(delivery_count: data["custom_fields"].first["data"],actual_delivery: data["started_datetime_formatted"].to_datetime.strftime("%I:%M%p"),total_km: data["total_distance"])
   logger.info(data)

  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_driver
      @driver = Driver.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def driver_params
      params.require(:driver).permit!#(:driver_name, :vehicle_no, :vehicle_type, :contact_no, :proof, :username, :password)
    end
end