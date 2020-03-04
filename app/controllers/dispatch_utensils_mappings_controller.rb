class DispatchUtensilsMappingsController < ApplicationController
  before_action :set_dispatch_utensils_mapping, only: [:show, :edit, :update, :destroy]

  # GET /dispatch_utensils_mappings
  # GET /dispatch_utensils_mappings.json
  def index
    @dispatch_utensils_mappings = DispatchUtensilsMapping.all
  end

  # GET /dispatch_utensils_mappings/1
  # GET /dispatch_utensils_mappings/1.json
  def show
  end

  # GET /dispatch_utensils_mappings/new
  def new
    @dispatch_utensils_mapping = DispatchUtensilsMapping.new
  end

  # GET /dispatch_utensils_mappings/1/edit
  def edit
  end

  # POST /dispatch_utensils_mappings
  # POST /dispatch_utensils_mappings.json
  def create
    @dispatch_utensils_mapping = DispatchUtensilsMapping.new(dispatch_utensils_mapping_params)

    respond_to do |format|
      if @dispatch_utensils_mapping.save
        format.html { redirect_to @dispatch_utensils_mapping, notice: 'Dispatch utensils mapping was successfully created.' }
        format.json { render :show, status: :created, location: @dispatch_utensils_mapping }
      else
        format.html { render :new }
        format.json { render json: @dispatch_utensils_mapping.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dispatch_utensils_mappings/1
  # PATCH/PUT /dispatch_utensils_mappings/1.json
  def update
    respond_to do |format|
      if @dispatch_utensils_mapping.update(dispatch_utensils_mapping_params)
        format.html { redirect_to @dispatch_utensils_mapping, notice: 'Dispatch utensils mapping was successfully updated.' }
        format.json { render :show, status: :ok, location: @dispatch_utensils_mapping }
      else
        format.html { render :edit }
        format.json { render json: @dispatch_utensils_mapping.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dispatch_utensils_mappings/1
  # DELETE /dispatch_utensils_mappings/1.json
  def destroy
    @dispatch_utensils_mapping.destroy
    respond_to do |format|
      format.html { redirect_to dispatch_utensils_mappings_url, notice: 'Dispatch utensils mapping was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def rec
      dispatched_ids = params["dispatched_ids"].split(",") if params["dispatched_ids"].present?
      dispatched_ids.map do |dispatch_id|
      dispatch = VesselDispatch.find(dispatch_id.to_i) if dispatch_id.to_i != 0
      dispatch.tag.update!(status: nil) if dispatch.present? && dispatch.tag.present?
      dispatch.update(utensil_received: true) if dispatch.present?
      utensil = Utensil.find(dispatch.utensil_id) if dispatch.present? && dispatch.utensil_id.present?
      dispatch_count = Tag.where(utensil_id: utensil.id, status: "Dispatched").count if utensil.present?
      utensil.update!(count_dummy: utensil.count - dispatch_count) if utensil.present?
    end
    # tag = Tag.find(params["tag_id"].to_i) if params["tag_id"].present? && params["tag_id"].to_i != 0
    # tag.update!(status: nil) if tag.present?
    # VesselDispatch.find(params["vd_id"].to_i).update(utensil_received: true) if params["vd_id"].present? && params["vd_id"].to_i != 0
    # dispatch_count = Tag.where(utensil_id: tag.utensil_id, status: "Dispatched").count if tag.present? && tag.utensil_id.present?
    # utensil = Utensil.find(tag.utensil_id) if tag.present? && tag.utensil_id.present?
    # utensil.update!(count_dummy: utensil.count - dispatch_count) if utensil.present?

    #redirect_to normalmenu_sites_notreceive_status_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dispatch_utensils_mapping
      @dispatch_utensils_mapping = DispatchUtensilsMapping.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dispatch_utensils_mapping_params
     params.require(:dispatch_utensils_mapping).permit! #(:dispatch_id, :utensil_id, :return_status, :food_return_id, :utensil_count)
    end
end














# --------------------------------



# @received=DispatchUtensilsMapping.find(params[:format]).update(:status=>"Received")
    # #@true=DispatchUtensilsMapping.find(params[:format])
    # orginal_count = DispatchUtensilsMapping.find(params[:format]).utensil.count_dummy
    # count =DispatchUtensilsMapping.find(params[:format]).count_dummy
    # @true = DispatchUtensilsMapping.find(params[:format]).utensil.update(:available_status=>"true", :status => 1,count_dummy:(orginal_count.to_i-count.to_i))