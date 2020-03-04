class PageConfigurationsController < ApplicationController
  before_action :set_page_configuration, only: [:show, :edit, :update, :destroy]

  # GET /page_configurations
  # GET /page_configurations.json
  def index
    @page_configurations = PageConfiguration.all
  end

  # GET /page_configurations/1
  # GET /page_configurations/1.json
  def show
  end

  # GET /page_configurations/new
  def new
    @page_configuration = PageConfiguration.new
    @page = Page.all
  end

  # GET /page_configurations/1/edit
  def edit
  end

  # POST /page_configurations
  # POST /page_configurations.json
  def create
    @page_configuration = PageConfiguration.new(page_configuration_params)

#params[:page_configuration][:page_id]
#    respond_to do |format|
      @page_ids = params[:page_configuration][:page_id].reject{|kk|kk==""}
      @page_ids.map do |kk|
        PageConfiguration.create(:page_id=> kk, :tenant_id=> page_configuration_params[:tenant_id])
      end
      redirect_to :action=>"index"
=begin     if @page_configuration.save


      format.html { redirect_to @page_configuration, notice: 'Page configuration was successfully created.' }
      format.json { render :show, status: :created, location: @page_configuration }
    else
      format.html { render :new }
      format.json { render json: @page_configuration.errors, status: :unprocessable_entity }
    end
=end  
  end

  # PATCH/PUT /page_configurations/1
  # PATCH/PUT /page_configurations/1.json
  def update
    respond_to do |format|
      if @page_configuration.update(page_configuration_params)
        format.html { redirect_to @page_configuration, notice: 'Page configuration was successfully updated.' }
        format.json { render :show, status: :ok, location: @page_configuration }
      else
        format.html { render :edit }
        format.json { render json: @page_configuration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /page_configurations/1
  # DELETE /page_configurations/1.json
  def destroy
    @page_configuration.destroy
    respond_to do |format|
      format.html { redirect_to page_configurations_url, notice: 'Page configuration was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page_configuration
      @page_configuration = PageConfiguration.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_configuration_params
      params.require(:page_configuration).permit(:page_id, :tenant_id)
    end
end
