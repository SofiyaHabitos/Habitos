class CutleryDispatchesController < ApplicationController
  before_action :set_cutlery_dispatch, only: [:show, :edit, :update, :destroy]

  # GET /cutlery_dispatches
  # GET /cutlery_dispatches.json
  def index
    @cutlery_dispatches = CutleryDispatche.all
  end

  # GET /cutlery_dispatches/1
  # GET /cutlery_dispatches/1.json
  def show
  end

  # GET /cutlery_dispatches/new
  def new
    @cutlery_dispatch = CutleryDispatche.new
  end

  # GET /cutlery_dispatches/1/edit
  def edit
  end

  
  # POST /cutlery_dispatches
  # POST /cutlery_dispatches.json
  def create
    @cutlery_dispatch = CutleryDispatche.new(cutlery_dispatch_params)

    respond_to do |format|
      if @cutlery_dispatch.save
        format.html { redirect_to action: "index", notice: 'Cutlery dispatche was successfully created.' }
        format.json { render :show, status: :created, location: @cutlery_dispatch }
      else
        format.html { render :new }
        format.json { render json: @cutlery_dispatch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cutlery_dispatches/1
  # PATCH/PUT /cutlery_dispatches/1.json
  def update
    respond_to do |format|
      if @cutlery_dispatch.update(cutlery_dispatch_params)
        format.html { redirect_to action: "index", notice: 'Cutlery dispatche was successfully updated.' }
        format.json { render :show, status: :ok, location: @cutlery_dispatch }
      else
        format.html { render :edit }
        format.json { render json: @cutlery_dispatch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cutlery_dispatches/1
  # DELETE /cutlery_dispatches/1.json
  def destroy
    @cutlery_dispatch.destroy
    respond_to do |format|
      format.html { redirect_to cutlery_dispatches_url, notice: 'Cutlery dispatche was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cutlery_dispatch
      @cutlery_dispatch = CutleryDispatche.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cutlery_dispatch_params
      params.fetch(:cutlery_dispatch, {})
    end
end
