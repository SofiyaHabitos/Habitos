class AlleriesController < ApplicationController
  before_action :set_allery, only: [:show, :edit, :update, :destroy]

  # GET /alleries
  # GET /alleries.json
  def index
    @alleries = Allery.all
  end

  # GET /alleries/1
  # GET /alleries/1.json
  def show
  end

  # GET /alleries/new
  def new
    @allery = Allery.new
  end

  # GET /alleries/1/edit
  def edit
  end

  # POST /alleries
  # POST /alleries.json
  def create
    @allery = Allery.new(allery_params)
   
    respond_to do |format|
      if @allery.save
        @allery.update(:created_by=>session[:kitchen_user_id])
        format.html { redirect_to action: "index", notice: 'Allery was successfully created.' }
        format.json { render :show, status: :created, location: @allery }
      else
        format.html { render :new }
        format.json { render json: @allery.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /alleries/1
  # PATCH/PUT /alleries/1.json
  def update
    respond_to do |format|
      if @allery.update(allery_params)
        @allery.update(:updated_by=>session[:kitchen_user_id])
        format.html { redirect_to action: "index", notice: 'Allery was successfully updated.' }
        format.json { render :show, status: :ok, location: @allery }
      else
        format.html { render :edit }
        format.json { render json: @allery.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /alleries/1
  # DELETE /alleries/1.json
  def destroy
    @allery.destroy
    respond_to do |format|
      format.html { redirect_to alleries_url, notice: 'Allery was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_allery
      @allery = Allery.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def allery_params
      params.require(:allery).permit(:name, :description)
    end
end
