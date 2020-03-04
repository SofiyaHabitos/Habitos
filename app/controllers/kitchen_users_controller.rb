class KitchenUsersController < ApplicationController
  before_action :set_kitchen_user, only: [:show, :edit, :update, :destroy]
  #before_filter :current_user1, only: [:login_validation]

  # GET /kitchen_users
  # GET /kitchen_users.json

  # def role_login
  #   byebug
  # end


  def index

    if ["superadmin"].include?(KitchenUser.find(session[:kitchen_user_id]).role.name)
      @kitchen_users = KitchenUser.all
    elsif KitchenUser.find(session[:kitchen_user_id]).role.name == "CEO"
      @kitchen_users = KitchenUser.includes(:role).where(:roles => {name: ["Admin","Chef","Dispatch Manager","Accounts executive", "procurement"]})
    elsif KitchenUser.find(session[:kitchen_user_id]).role.name == "Admin"
      @kitchen_users = KitchenUser.includes(:role).where(:roles => {name: ["Chef","Dispatch Manager","Accounts executive", "procurement"]})
    # elsif KitchenUser.find(session[:kitchen_user_id]).role.name == "Chef"
    #   @kitchen_users = KitchenUser.includes(:role).where(:roles => {name: "Dispatch Manager"})
    else
      return "nothing"
    end    
  end



  # GET /kitchen_users/1
  # GET /kitchen_users/1.json
  def show
  end

  # GET /kitchen_users/new
  def new
    @kitchen_user = KitchenUser.new
    @tenant=[]

    if ["superadmin"].include?(KitchenUser.find(session[:kitchen_user_id]).role.name)
       @kitchen_users = Role.all
    elsif KitchenUser.find(session[:kitchen_user_id]).role.name == "CEO"
      @kitchen_users = Role.where(name: ["Admin","Chef","Dispatch Manager","Accounts executive", "procurement"])
    elsif KitchenUser.find(session[:kitchen_user_id]).role.name == "Admin"
      @kitchen_users = Role.where(name: ["Chef","Dispatch Manager","Accounts executive", "procurement"])
 
    else
      return "nothing"
    end    
  end

  # GET /kitchen_users/1/edit
  def edit
    @tenant=Tenant.where.not(:name=>"Idlidabba")
    if ["superadmin"].include?(KitchenUser.find(session[:kitchen_user_id]).role.name)
      @kitchen_users = Role.all
    elsif KitchenUser.find(session[:kitchen_user_id]).role.name == "CEO"
      @kitchen_users = Role.where(name: ["Admin","Chef","Dispatch Manager","Accounts executive", "procurement"])
    elsif KitchenUser.find(session[:kitchen_user_id]).role.name == "Admin"
      @kitchen_users = Role.where(name: ["Chef","Dispatch Manager","Accounts executive", "procurement"])
      #@kitchen_users = KitchenUser.all.map{|user| user.role.name == "Chef" || "Dispatch Manager"}
    # elsif KitchenUser.find(session[:kitchen_user_id]).role.name == "Chef"
    #   @kitchen_users = KitchenUser.includes(:role).where(:roles => {name: "Dispatch Manager"})
    else
      return "nothing"
    end   
  end

  def login
    @kitchen_user=KitchenUser.new
    render :layout=>false
  end
  
  def login_validation
    params.permit!
    kitchen_user=KitchenUser.where(:user_name=>params[:kitchen_user][:user_name]).where(:password_digest=>params[:kitchen_user][:password_digest])
    if not kitchen_user.blank?
      session[:kitchen_user_id] = kitchen_user.first.id
      kitchen_user.update(:is_logged_in => true)
      role = KitchenUser.find(session[:kitchen_user_id]).role.name
      Tenant.where('to_date <?', Date.today).map{|i| i.update(:active => false)}
      case role

        when "CEO"
          redirect_to  :controller=>"normalmenu_sites",:action=>"dashboard"
        when "Administrator"
          redirect_to :controller=>"normalmenu_sites",:action=>"dashboard"
        when "Nutrition"
          redirect_to  :controller=>"normalmenu_sites",:action=>"dashboard"
        # when "Chef"
        #   redirect_to  :controller=>"normalmenu_sites",:action=>"dashboard"
        # when "Dispatch Manager"
        #   redirect_to  :controller=>"normalmenu_sites",:action=>"dashboard"
        when "Audit Manager"
          redirect_to  :controller=>"normalmenu_sites",:action=>"dashboard"
        when "superadmin"
          redirect_to  :controller=>"normalmenu_sites",:action=>"dashboard"
        when "Admin"
           redirect_to  :controller=>"normalmenu_sites",:action=>"dashboard"
        when "Chef"
           redirect_to  :controller=>"normalmenu_sites",:action=>"dashboard"
        when "Dispatch Manager"
           redirect_to  :controller=>"normalmenu_sites",:action=>"dashboard"
        when "Accounts executive"
           redirect_to  :controller=>"normalmenu_sites",:action=>"dashboard"
        when "procurement"
           redirect_to  :controller=>"normalmenu_sites",:action=>"dashboard"
      end
    else
      redirect_to root_path, notice: "Invalid Username or Password!" and return
    end
  end

  def logout
    #current_user.update(:is_logged_in => false)
    KitchenUser.find(session[:kitchen_user_id]).update(:is_logged_in => false)
    session[:kitchen_user_id]=nil
    redirect_to root_path 
  end

  # POST /kitchen_users
  # POST /kitchen_users.json
  def create
    params.permit!
    @kitchen_user = KitchenUser.new(kitchen_user_params)
    #params[:kitchen_user][:tenant].shift if params[:kitchen_user] && params[:tenant].present?
    #@kitchen_user.update(:tenant=>params[:kitchen_user][:tenant])
    respond_to do |format|
      if @kitchen_user.save
        @kitchen_user.update(:created_by=>session[:kitchen_user_id])
        KitchenNotifierMailer.send_kitchen_email(@kitchen_user).deliver
        format.html { redirect_to action: "index", notice: 'Kitchen user was successfully created.' }
        format.json { render :show, status: :created, location: @kitchen_user }
      else
        format.html { render :new }
        format.json { render json: @kitchen_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kitchen_users/1
  # PATCH/PUT /kitchen_users/1.json
  def update
    params[:kitchen_user][:tenant].shift if params[:kitchen_user] && params[:tenant].present?
    @kitchen_user.update(:tenant=>params[:kitchen_user][:tenant])
    respond_to do |format|
      if @kitchen_user.update(kitchen_user_params)
        @kitchen_user.update(:updated_by=>session[:kitchen_user_id])
        KitchenNotifierMailer.send_kitchen_email(@kitchen_user).deliver_now
        format.html { redirect_to action: "index", notice: 'Kitchen user was successfully updated.' }
        format.json { render :show, status: :ok, location: @kitchen_user }
      else
        format.html { render :edit }
        format.json { render json: @kitchen_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kitchen_users/1
  # DELETE /kitchen_users/1.json
  def destroy
  
    @kitchen_user.destroy
    respond_to do |format|
      format.html { redirect_to kitchen_users_url, notice: 'Kitchen user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



  def dynamic_drop
    tenant=Kitchen.find(params[:format]).tenants
    if tenant.present?
      @tenant=tenant.where.not(:name=>"Idlidabba")
    end
  end  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kitchen_user
      unless params[:id] == "undefined"
        @kitchen_user = KitchenUser.find(params[:id])
      else
        redirect_to action: "index"
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def kitchen_user_params
      params.require(:kitchen_user).permit(:name, :user_name, :password_digest, :email, :mobile_number, :address, :auth_token, :role_id,:kitchen_id,[:tenant], :created_by, :updated_by,:status)
    end
end
