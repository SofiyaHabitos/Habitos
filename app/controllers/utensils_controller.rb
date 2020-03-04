class UtensilsController < ApplicationController
  before_action :set_utensil, only: [:show, :edit, :update, :destroy]

  # GET /utensils
  # GET /utensils.json
  def index
    @utensils = Utensil.all
   # @utensils = Utensil.paginate(:page => params[:page], :per_page => 10)
  end


  def sync_utensil_available_count
    Utensil.all.map do |utensil|
        available_count = utensil.tags.present? ? utensil.tags.where(status: nil).count : utensil.count
        utensil.update!(count_dummy: available_count)
    end
    redirect_to utensils_path
  end


  # GET /utensils/1
  # GET /utensils/1.json
  def show
  end

  # GET /utensils/new
  def new
    @utensil = Utensil.new
    @cat = []
    @utensil.tags.build
  end

  # GET /utensils/1/edit
  def edit
 
    @cat = DepriciationCategory.where(id: @utensil.depriciation_category.to_i).pluck(:depreciation_percentage)
    @tags = @utensil.tags
  end

  # POST /utensils
  # POST /utensils.json
 def create
    
    utensil = Utensil.new(utensil_params)
    #utensil.upload_status = params[:upload_type]
    #utensil.upload_status = params[:upload_type]
    #utensil.asset_type = params[:asset_type]
    #utensil.utensils_category_id= params[:utensils_category_id]
    #utensil.tracking = Utensil.generate_tracking(utensil)
    respond_to do |format|
      if utensil.save
        Utensil.generate_tracking(utensil) if utensil.asset_type == "Transit"
        utensil.update(:created_by=>session[:kitchen_user_id],:count_dummy=>utensil.count)
        format.html { redirect_to utensils_url }
        format.json { render :show, status: :created, location: utensil }
      else
        format.html { render :new }
        format.json { render json: utensil.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /utensils/1
  # PATCH/PUT /utensils/1.json
  def update
    respond_to do |format|
      if @utensil.update(utensil_params)
         Utensil.generate_tracking(@utensil) if @utensil.asset_type == "Transit"
         @utensil.update(upload_status: params[:upload_type]) # ,:count_dummy=>@utensil.count
         #@utensil.asset_type = params[:asset_type]

         #@utensil.update(utensils_category_id:  params[:utensils_category_id])
         @utensil.update(:updated_by=>session[:kitchen_user_id])
        format.html { redirect_to action: "index", notice: 'Utensil was successfully updated.' }
        format.json { render :show, status: :ok, location: @utensil }
      else
        format.html { render :edit }
        format.json { render json: @utensil.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /utensils/1
  # DELETE /utensils/1.json
  def destroy
    @utensil.destroy
    respond_to do |format|
      format.html { redirect_to utensils_url, notice: 'Utensil was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def utensil_report
    report_path = Utensil.utensil_report
    send_file report_path
  end

  def fetch_utensil_category
    @utensil_category = UtensilsCategory.where(upload_status: params["upload_status"],asset_type: params["asset_type"])
    if params["id"].present? 
    @utensil = Utensil.find(params["id"])
    end
  end

  def category
     @cat = DepriciationCategory.where(id: params["category"]).pluck(:depreciation_percentage)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_utensil
      @utensil = Utensil.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def utensil_params
      params.require(:utensil).permit!
    end
end
