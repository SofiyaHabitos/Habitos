class EnrolmentsController < ApplicationController
  before_action :set_enrolment, only: [:show, :edit, :update, :destroy]

  # GET /enrolments
  # GET /enrolments.json
  def index
    @enrolments = Enrolment.where(tenant_id: params[:format],is_active: true, status: "Approved")
  end

  def enrol_index
    #@tenants = Enrolment.all.group_by(&:tenant_id)
    @tenants = Enrolment.where(is_active: true, status: "Approved").group_by(&:tenant_id)
    @enrolments = Enrolment.all
  end

  def individual
    @enrolments = Enrolment.all      
  end

  def attendance
    @attendances = Attendance.where(:tenant_id => params[:format], :date => Date.today).order('enrolment_id ASC')
  end

  def attendance_index
    #@attendances = Attendance.where(:date => Date.today, attendance_log: true).group_by(&:tenant_id)
    @tenants = Tenant.where("from_date <= ? AND to_date >= ?", Date.today, Date.today).where(active: true)
  end

  # GET /enrolments/1
  # GET /enrolments/1.json
  def show
  end

  # GET /enrolments/new
  def new
    @enrolment = Enrolment.new
  end

  # GET /enrolments/1/edit
  def edit
  end

  def enrolment_upload
    @enrolment=Enrolment.new
  end

  def upload_process
    #file = params[:enrolment][:file1]
    #filename = file.original_filename
    enrolment = Enrolment.upload(params)

    if enrolment.class == Array and enrolment.count == 6

      if enrolment[2].present? and enrolment[3].present? and enrolment[4].present? and enrolment[5].present?
        flash[:notice] = "#{enrolment[0]} values has been successfully imported !!. #{enrolment[1]} values not saved!!. Standard #{enrolment[2]} is not in contract !!. Meal Time #{enrolment[3]} is not in contract !! Meal Restriction #{enrolment[4]} is not in contract !! . Meal Time #{enrolment[3]} is not in contract !! Student type #{enrolment[5]} is not in contract !! " 
      elsif enrolment[2].empty? and enrolment[3].empty? and enrolment[5].present?      
        flash[:notice] = "#{enrolment[0]} values has been successfully imported !!. #{enrolment[1]} values not saved!! Student Type #{enrolment[5]} is not in contract !! "

      elsif enrolment[2].empty? and enrolment[3].present?
        flash[:notice] = "#{enrolment[0]} values has been successfully imported !!. #{enrolment[1]} values not saved!! Meal Time #{enrolment[3]} is not in contract !! "
      elsif enrolment[2].present? and enrolment[3].empty?
        flash[:notice] = "#{enrolment[0]} values has been successfully imported !!. #{enrolment[1]} values not saved!! Standard #{enrolment[2]} is not in contract !! "
      elsif enrolment[2].empty? and enrolment[3].empty? 

        flash[:notice] = "#{enrolment[0]} values has been successfully imported !!. #{enrolment[1]} values not saved!!"
      elsif  enrolment[4]==0
        flash[:notice] = "#{enrolment[4]} values not imported !!. #{enrolment[1]} values not saved!! ..Meal Restriction #{enrolment[4]} is not in contract !!"
      end

    elsif enrolment.class == String      
      flash[:notice] = "#{enrolment}"
    else
      flash[:notice] = "Please try again!!"
    end
    redirect_to :action=> "enrol_index"

=begin
    if @enrolment == "File Invalid"
      flash[:notice] = "File Invalid"
      redirect_to :action=> "index"
    elsif @enrolment == "File Invalidddd"
      flash[:notice] = "Invalid Header Format!"
      redirect_to :action=> "index"
    elsif @enrolment == "meal_restriction is nill"
      flash[:notice] = "Meal Restriction column is must"
      redirect_to :action=> "index"
    elsif @enrolment == "c"
      flash[:notice] = "All Fields are Required"
      redirect_to :action=> "index"
    elsif @enrolment.present? &&  @enrolment.first.kind_of?(Integer) && @enrolment.last.empty?
      flash[:notice] = "#{@enrolment.first} Value Already Exists"
      redirect_to :action=> "index"
    elsif @enrolment.present? &&  @enrolment.first.nil? && @enrolment.last.present?
      flash[:notice] = "Your File Has been Successfully Imported."
      redirect_to :action=> "index"
    elsif @enrolment.present? &&  @enrolment.first.kind_of?(Integer) && @enrolment.last.present?
      tcount = @enrolment.last.count
      flash[:notice] = "#{tcount} values has been successfully imported. #{@enrolment.first} values already exists"
      redirect_to :action=> "index"
    else
      flash[:notice] = "Data Invalid"
      redirect_to :action=> "index"
    end
=end

  end

  # POST /enrolments
  # POST /enrolments.json
  def create
    @enrolment = Enrolment.new(enrolment_params)
    respond_to do |format|
      if @enrolment.save
        format.html { redirect_to @enrolment, notice: 'Enrolment was successfully created.' }
        format.json { render :show, status: :created, location: @enrolment }
      else
        format.html { render :new }
        format.json { render json: @enrolment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /enrolments/1
  # PATCH/PUT /enrolments/1.json
  def update
    respond_to do |format|
      if @enrolment.update(enrolment_params)
        format.html { redirect_to @enrolment, notice: 'Enrolment was successfully updated.' }
        format.json { render :show, status: :ok, location: @enrolment }
      else
        format.html { render :edit }
        format.json { render json: @enrolment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enrolments/1
  # DELETE /enrolments/1.json
  def destroy
    @enrolment.destroy
    respond_to do |format|
      format.html { redirect_to enrolments_url, notice: 'Enrolment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def approval_screen
    @approval_enrolment=Enrolment.where(is_active:false,status:"WaitingForApproval")
    @delete_enrolment=Enrolment.where(is_active:true ,status:"WaitingForApproval")
  end

  def newenrol_approval
    if params["commit"] == "Approve"
      Enrolment.where(id: params[:approval_id]).update(is_active: true, status: "Approved")
      enrolment = Enrolment.Tenant_update_details(params)
      if enrolment.class == Array 
         flash[:notice] = "#{enrolment[0]} #{enrolment[1]}"
       else
         flash[:notice] = "#{enrolment}"

      end
    elsif params["commit"] == "Reject"
      Enrolment.where(id: params[:approval_id]).destroy_all
      flash[:notice]="Enrolment Rejected"
    end
    redirect_to action: "approval_screen"    
  end

  def enrol_delete_approval
    if params["commit"] == "Approve"
        Enrolment.where(id: params[:approval_id]).update(is_active: false, status: "Approved").map{|i| i.destroy}
    elsif params["commit"] == "Reject"
         Enrolment.where(id: params[:approval_id]).update(is_active: true, status: "Rejected")
    end
    redirect_to action: "approval_screen"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enrolment
      unless params[:id] == "undefined"
        @enrolment = Enrolment.find(params[:id])
      else
        redirect_to action: "index"
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def enrolment_params
      params.require(:enrolment).permit(:name, :age_type, :date_of_birth, :height, :weight, :bmi, :standard, :id_number, :meal_plan, :meal_time, :food_category_id, :from_date, :to_date, :enrolment_type, :payment, :tenant_id, :user_id)
    end

end
