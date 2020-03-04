class UnitOfMeasurementsController < ApplicationController
  before_action :set_unit_of_measurement, only: [:show, :edit, :update, :destroy]
  rescue_from ActionController::RedirectBackError, with: :redirect_to_default

  # GET /unit_of_measurements
  # GET /unit_of_measurements.json
  def index
    @unit_of_measurements = UnitOfMeasurement.all
  end

  # GET /unit_of_measurements/1
  # GET /unit_of_measurements/1.json
  def show

  end

  # GET /unit_of_measurements/new
  def new
    @unit_of_measurement = UnitOfMeasurement.new
  end

  # GET /unit_of_measurements/1/edit
  def edit

  end

  def bck
    redirect_to :back
  end

  # POST /unit_of_measurements
  # POST /unit_of_measurements.json
  def create
    @unit_of_measurement = UnitOfMeasurement.new(unit_of_measurement_params)

    respond_to do |format|
      if @unit_of_measurement.save
        @unit_of_measurement.update(:created_by=>session[:kitchen_user_id])
        format.html { redirect_to action: "index", notice: 'Unit of measurement was successfully created.' }
        format.json { render :show, status: :created, location: @unit_of_measurement }
      else
        format.html { render :new }
        format.json { render json: @unit_of_measurement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /unit_of_measurements/1
  # PATCH/PUT /unit_of_measurements/1.json
  def update
    respond_to do |format|
      if @unit_of_measurement.update(unit_of_measurement_params)
        @unit_of_measurement.update(:updated_by=>session[:kitchen_user_id])
        format.html { redirect_to action: "index", notice: 'Unit of measurement was successfully updated.' }
        format.json { render :show, status: :ok, location: @unit_of_measurement }
      else
        format.html { render :edit }
        format.json { render json: @unit_of_measurement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /unit_of_measurements/1
  # DELETE /unit_of_measurements/1.json
  def destroy
    @unit_of_measurement.destroy
    respond_to do |format|
      format.html { redirect_to unit_of_measurements_url, notice: 'Unit of measurement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unit_of_measurement
      @unit_of_measurement = UnitOfMeasurement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def unit_of_measurement_params
      #params.fetch(:unit_of_measurement, {})
      params.require(:unit_of_measurement).permit(:name, :description)
    end

    def redirect_to_default
      redirect_to root_path
    end

end
