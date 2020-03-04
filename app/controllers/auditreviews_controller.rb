class AuditreviewsController < ApplicationController
  #before_action :set_auditreview, only: [:show, :edit, :update, :destroy]

  # GET /auditreviews
  # GET /auditreviews.json
  def index

    @tenants = Tenant.all

    unless params["audit"].present?
      @auditreviews = Auditreview.all
      #@auditreviews = Auditreview.paginate(:page => params[:page], :per_page => 10)
      @reviews = Answer.all
    else
      @reviews = Answer.where(tenant_id: params["audit"]["id"],date: params["audit"]["from_date"]..params["audit"]["to_date"])
       
    end

   # @reviews = Answer.paginate(:page => params[:page], :per_page => 10).order('created_at DESC')
  end

  # GET /auditreviews/1
  # GET /auditreviews/1.json
  def show
    @answer = Answer.find(params[:id])
  end

  # GET /auditreviews/new
  def new
    @auditreview = Auditreview.new
  end

  # GET /auditreviews/1/edit
  def edit
  end

  # POST /auditreviews
  # POST /auditreviews.json
  def create
    @auditreview = Auditreview.new(auditreview_params)
    respond_to do |format|
      if @auditreview.save
        format.html { redirect_to action: "index", notice: 'Auditreview was successfully created.' }
        format.json { render :show, status: :created, location: @auditreview }
      else
        format.html { render :new }
        format.json { render json: @auditreview.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /auditreviews/1
  # PATCH/PUT /auditreviews/1.json
  def update
    respond_to do |format|
      if @auditreview.update(auditreview_params)
        format.html { redirect_to action: "index", notice: 'Auditreview was successfully updated.' }
        format.json { render :show, status: :ok, location: @auditreview }
      else
        format.html { render :edit }
        format.json { render json: @auditreview.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /auditreviews/1
  # DELETE /auditreviews/1.json
  def destroy
    @auditreview.destroy
    respond_to do |format|
      format.html { redirect_to auditreviews_url, notice: 'Auditreview was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def audit_report
   if params["audit"].present?
    redirect_to auditreviews_path(audit: params["audit"])
  else
    redirect_to auditreviews_path
  end
    
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auditreview
      @auditreview = Auditreview.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def auditreview_params
      #params.fetch(:auditreview, {})
      params.require(:auditreview).permit(:tenant_id, :date, :correct, :incorrect, :mealtime, :category, :rating)
    end
end
