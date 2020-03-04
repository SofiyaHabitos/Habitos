class UtensilsCountMappingsController < ApplicationController
  before_action :set_utensils_count_mapping, only: [:show, :edit, :update, :destroy]

  # GET /utensils_count_mappings
  # GET /utensils_count_mappings.json
  def index
    @utensils_count_mappings = UtensilsCountMapping.all
  end

  # GET /utensils_count_mappings/1
  # GET /utensils_count_mappings/1.json
  def show
  end

  # GET /utensils_count_mappings/new
  def new
    @utensils_count_mapping = UtensilsCountMapping.new
  end

  # GET /utensils_count_mappings/1/edit
  def edit
  end

  # POST /utensils_count_mappings
  # POST /utensils_count_mappings.json
  def create
    @utensils_count_mapping = UtensilsCountMapping.new(utensils_count_mapping_params)

    respond_to do |format|
      if @utensils_count_mapping.save
        format.html { redirect_to @utensils_count_mapping, notice: 'Utensils count mapping was successfully created.' }
        format.json { render :show, status: :created, location: @utensils_count_mapping }
      else
        format.html { render :new }
        format.json { render json: @utensils_count_mapping.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /utensils_count_mappings/1
  # PATCH/PUT /utensils_count_mappings/1.json
  def update
    respond_to do |format|
      if @utensils_count_mapping.update(utensils_count_mapping_params)
        format.html { redirect_to @utensils_count_mapping, notice: 'Utensils count mapping was successfully updated.' }
        format.json { render :show, status: :ok, location: @utensils_count_mapping }
      else
        format.html { render :edit }
        format.json { render json: @utensils_count_mapping.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /utensils_count_mappings/1
  # DELETE /utensils_count_mappings/1.json
  def destroy
    @utensils_count_mapping.destroy
    respond_to do |format|
      format.html { redirect_to utensils_count_mappings_url, notice: 'Utensils count mapping was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_utensils_count_mapping
      @utensils_count_mapping = UtensilsCountMapping.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def utensils_count_mapping_params
      params.fetch(:utensils_count_mapping, {})
    end
end
