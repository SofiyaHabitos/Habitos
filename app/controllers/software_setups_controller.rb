class SoftwareSetupsController < ApplicationController
  before_action :set_software_setup, only: [:show, :edit, :update, :destroy]

  # GET /software_setups
  # GET /software_setups.json
  def index
    @software_setups = SoftwareSetup.all
   # @software_setups = SoftwareSetup.paginate(:page => params[:page], :per_page => 10)
  end

  # GET /software_setups/1
  # GET /software_setups/1.json
  def show
  end

  # GET /software_setups/new
  def new
    
    @software_setup = SoftwareSetup.new
    @user = User.new
    #@software_setup.build_user
  end

  # GET /software_setups/1/edit
  def edit

    @user = @software_setup.user
  end

  # POST /software_setups
  # POST /software_setups.json
   def create
   # @software_setup = SoftwareSetup.new(software_setup_params)
   params.permit!
    params[:software_setup][:user].delete_if {|key, value| (key == "user_name" && value == "") || (key == "password_digest" && value == "") }
   user_id=User.create!(params[:software_setup][:user]).id
   SoftwareSetup.create!(:software_privileges=>params[:software_setup][:software_privileges],:attendance=>params[:software_setup][:attendance],:user_id=>user_id)
    #respond_to do |format|
     # if @software_setup.save
      #  format.html { redirect_to action: "index", notice: 'Software setup was successfully created.' }
       # format.json { render :show, status: :created, location: @software_setup }
      #else
       # format.html { render :new }
       # format.json { render json: @software_setup.errors, status: :unprocessable_entity }
      #end
    #end
    #software setup details mail to tenant
    SoftwareNotifierMailer.send_software_email(user_id).deliver
    SoftwareSetup.update(:created_by=>session[:kitchen_user_id])
    redirect_to action: "index"
  end

  # PATCH/PUT /software_setups/1
  # PATCH/PUT /software_setups/1.json
  def update

 # respond_to do |format|
     params.permit!
     user_id=SoftwareSetup.find(params[:id]).user_id
    # params[:software_setup][:user].delete_if {|key, value| key == "user_name"||"password_digest" && value == "" }
      params[:software_setup][:user].delete_if {|key, value| (key == "user_name" && value == "") || (key == "password_digest" && value == "") }
     User.find(user_id).update(params[:software_setup][:user])
     SoftwareSetup.find(params[:id]).update(:software_privileges=>params[:software_setup][:software_privileges],:attendance=> params[:software_setup][:attendance]=="on" ? nil : params[:software_setup][:attendance] ,:user_id=>user_id)
       # format.html { redirect_to action: "index", notice: 'Software setup was successfully updated.' }
    #    format.json { render :show, status: :ok, location: @software_setup }
    #  else
    #    format.html { render :edit }
    #    format.json { render json: @software_setup.errors, status: :unprocessable_entity }
    #  end
  #  end
  SoftwareNotifierMailer.send_software_email(user_id).deliver
  SoftwareSetup.update(:updated_by=>session[:kitchen_user_id])
   redirect_to action: "index"
  end

  # DELETE /software_setups/1
  # DELETE /software_setups/1.json
  def destroy
    @software_setup.destroy
    respond_to do |format|
      format.html { redirect_to software_setups_url, notice: 'Software setup was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def software_delete
    @soft = SoftwareSetup.find(params["id"])
    @soft.delete
    SoftwareSetup.deleted.each{|i| i.really_destroy!}
    redirect_to action: "index"
  end

  def check_username_present
    
    if User.where(:user_name=>(params[:username])).present?
      msg = "User name already taken"
          render json: {"message"=> msg}
    else
      msg = ""
          render json: {"message"=> msg}
    end
   end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_software_setup
     unless params[:id] == "undefined"
      @software_setup = SoftwareSetup.find(params[:id])
    else
      redirect_to software_setups_url
    end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def software_setup_params
     # byebug
      #params.fetch(:software_setup, {})
      params.require(:software_setup).permit(:software_privileges,  :attendance,user_attributes:[:name,:user_name,:password_digest,:tenant_id])
    end
end
