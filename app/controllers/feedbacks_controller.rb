class FeedbacksController < ApplicationController
  before_action :set_feedback, only: [:show, :edit, :update, :destroy]

  # GET /feedbacks
  # GET /feedbacks.json
  def index
   # @feedbacks = Feedback.where(status:"WaitingForApproval")
   # @feedbacks = Feedback.where(status: [nil,"WaitingForApproval"])
   @feedbacks = Feedback.all

    @tenant = Tenant.new
    @tenants = Tenant.where("from_date <= ? AND to_date >= ?", Date.today, Date.today).where(active: true)    
   #@feedbacks = Feedback.paginate(:page => params[:page], :per_page => 10)
  end

  # GET /feedbacks/1
  # GET /feedbacks/1.json
  def show
  end

  # GET /feedbacks/new
  def new
    @feedback = Feedback.new
  end

  # GET /feedbacks/1/edit
  def edit
    @feedback=Feedback.find(params["id"])
  end

   def allow_update
     @feedback = Feedback.allow()
     redirect_to action: "index"
   end 
  # POST /feedbacks
  # POST /feedbacks.json
  def create
    @feedback = Feedback.new(feedback_params)

    respond_to do |format|
      if @feedback.save
        format.html { redirect_to action: "index", notice: 'Feedback was successfully created.' }
        format.json { render :show, status: :created, location: @feedback }
      else
        format.html { render :new }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /feedbacks/1
  # PATCH/PUT /feedbacks/1.json
  def update
    
    respond_to do |format|
      if @feedback.update(feedback_params)
        format.html { redirect_to action: "index", notice: 'Feedback was successfully updated.' }
        format.json { render :show, status: :ok, location: @feedback }
      else
        format.html { render :edit }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feedbacks/1
  # DELETE /feedbacks/1.json
  def destroy
    @feedback.destroy
    respond_to do |format|
      format.html { redirect_to feedbacks_url, notice: 'Feedback was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


=begin
      def food_returns_report
      file_path = FoodReturn.food_returns_report(params)
      send_file file_path 
  end
=end
  def feedbackchart
    
  end

  def driver_report
  end

  def feedback_report
      file_path = Feedback.feedback_report(params)
      send_file file_path
  end

  def approval_feedback
    Feedback.where(id:params[:approval_id]).update(status:"Approved")
    redirect_to :action=> "index"
  end

  def feedback_update
    params.permit!
      if Feedback.find(params["feedback"][:id]).update(tenant_id:params["feedback"]["tenant_id"], :date=>params[:date], :username=>params["username"], :age_type=>params["age_type"], :rating=>params['rating'], :favourite_dish=>params["favourite_dish"], :least_dish=>params["least_dish"], :comment=>params["comment"], :reason=>params["reason"])

        redirect_to action: "index", notice: 'Feedback was successfully updated.' 
        
      else
         render "edit" 
        
      end
    
 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feedback
      @feedback = Feedback.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def feedback_params
      #params.fetch(:feedback, {})
      params.require(:feedback).permit(:tenant_id, :date, :username, :age_type, :rating, :tenant_id, :favourite_dish, :least_dish, :comment, :reason)
    end
end
