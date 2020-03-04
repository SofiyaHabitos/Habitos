class TenantsController < ApplicationController
  before_action :set_tenant, only: [:show, :edit, :update, :destroy]
  before_action :check_meal_info, only: [:create]
  #before_action :set_permission, only: [:create,:edit,:update,:destroy]
  require 'rest-client'

  # GET /tenants
  # GET /tenants.json
  def index
    @tenants = Tenant.where.not(:name=>"Idlidabba")
    @all_colors = Tenant.pluck(:color_code).reject(&:nil?)
   # @tenants = Tenant.paginate(:page => params[:page], :per_page => 10)
  end

  # GET /tenants/1
  # GET /tenants/1.json
  def show
  spread_type = @tenant.tenant_details.pluck(:spread_type).uniq.join(",") unless @tenant.tenant_details.nil?

  @spread = JSON.parse RestClient.get("#{$pim_core_service}/pimcore/api/FoodRecepie/SpreadName?id="+spread_type)

            
  end

  # GET /tenants/new
  def new
    @tenant = Tenant.new
    @tenant.build_image
    @tenant.tenant_details.build
    @duplication_status = false
    @spread = JSON.parse RestClient.get("#{$pim_core_service}/pimcore/api/FoodRecepie/SpreadName")
  end
  # GET /tenants/1/edit
  def edit
    #@tenant_details = @tenant.tenant_details.build    
    #@image = @tenant.build_image 
    @duplication_status = false
    @spread = JSON.parse RestClient.get("#{$pim_core_service}/pimcore/api/FoodRecepie/SpreadName")
   
  end

  # POST /tenants
  # POST /tenants.json
  def create  
     
     @tenant =Tenant.new(tenant_params)
     meal_spread_data = tenant_params["tenant_details_attributes"].map{|i| [i[1]["meal_time"], i[1]["stud_type"], i[1]["spread_type"]] if i[1] != nil }
     duplication_values = meal_spread_data.group_by{ |e| e }.select { |k, v| v.size > 1 }.map(&:first)
     
       if duplication_values.uniq == []
         respond_to do |format|
        data = tenant_params

        tookan = {"api_key": "50646180f541481e4c422b614c5825431be3c2f82fd57936541c03","user_type": 0,"name": data[:name],"phone": data[:phone1],"email": data[:email],"address": data[:address],"latitude": data[:latitude],"longitude": data[:longitude]}
        response = RestClient.post "https://api.tookanapp.com/v2/customer/add", tookan.to_json, :content_type => "application/json"
        response = JSON.parse(response)
        
        if response["status"] == 200
          if @tenant.save 
            @tenant.update(customer_id: response["data"]["customer_id"])
            food_category = FoodCategory.find_or_create_by(name: "Veg")
            @tenant.tenant_details.update(food_category_id: food_category.id)
            @tenant.update(:created_by=>session[:kitchen_user_id],feedback_code: "HU00"+''+@tenant.id.to_s)    
            TenantNotifierMailer.send_cnfrmtn_email(@tenant).deliver 
            format.html { redirect_to tenants_url, notice: 'Tenant was successfully created.' }  
            format.json { render :show, status: :created, location: @tenant }
            end  
          else  
            format.html { redirect_to tenants_url }  
            format.json { render json: @tenant.errors, status: :unprocessable_entity }  
          end  
       end  
      else
        @spread = JSON.parse RestClient.get("#{$pim_core_service}/pimcore/api/FoodRecepie/SpreadName")
        @duplication_status = true
        render :new
      end
  end

  # PATCH/PUT /tenants/1
  # PATCH/PUT /tenants/1.json

# Tenant Update  https://api.tookanapp.com/v2/customer/edit
def update
    data = tenant_update_params
    tookan = {"api_key": "50646180f541481e4c422b614c5825431be3c2f82fd57936541c03","customer_id": @tenant.customer_id,"user_type": 0,"name": data[:name],"phone": data[:phone1],"email": data[:email],"address": data[:address],"latitude": data[:latitude],"longitude": data[:longitude]}
      response = RestClient.post "https://api.tookanapp.com/v2/customer/edit", tookan.to_json, :content_type => "application/json"
      response = JSON.parse(response)
      respond_to do |format|
      if response["status"] == 200
      if @tenant.update(tenant_update_params)
        food_category = FoodCategory.find_or_create_by(name: "Veg")
        @tenant.tenant_details.update(food_category_id: food_category.id)
        if @tenant.active == true
        end
      end
        @tenant.update(:updated_by=>session[:kitchen_user_id])
        format.html { redirect_to tenants_url, notice: 'Tenant was successfully updated.' }
        format.json { render :show, status: :ok, location: @tenant }
      else
        format.html { redirect_to tenants_url, notice: 'Tenant was not updated.' }
        format.json { render json: @tenant.errors, status: :unprocessable_entity }
      end
  end
end

  # DELETE /tenants/1
  # DELETE /tenants/1.json
  def destroy

    tookan = {"api_key": "50646180f541481e4c422b614c5825431be3c2f82fd57936541c03", "customer_id": @tenant.customer_id}
    response = RestClient.post "https://api.tookanapp.com/v2/delete_customer", tookan.to_json, :content_type => "application/json"
    response = JSON.parse(response)
    if response["status"] == 200
 
      @tenant.destroy
      respond_to do |format|
        format.html { redirect_to tenants_url, notice: 'Tenant was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
    
  end

  
  # Get the Client Category and Spread based on SiteCategory

  def check_mg_present      
    #@array = FoodGroup.where(:meal_time=>params[:select]).map{|d|d.food_category.name} 
    #@array = FoodGroup.where(:meal_time=>params[:select]).map{|d|d.food_category.name} 

    client_type = SiteCategory.find(params["site_category_id"])
    spread_type_ids = client_type.client_spread_types.pluck(:spread_type_id).join(",")
    spread_type_response = RestClient.get("#{$pim_core_service}/pimcore/api/FoodRecepie/SpreadName?id="+spread_type_ids)
    spread_data = JSON.parse(spread_type_response)
    @tenant = {client_categories: client_type.client_categories, Spread: spread_data["Spread"]}

  end

# old Customer Report 
  def customer_report
    file_path = Tenant.customer_report(params)
    send_file file_path  
    #redirect_to summaries_path
  end

# old Check the Meal true or false
  def check_meal_info
      if params[:tenant][:meal] == "true" && (tenant_params[:tenant_details_attributes]["0"][:meal_time] == "" || tenant_params[:tenant_details_attributes]["0"][:meal_plan] == "" || tenant_params[:tenant_details_attributes]["0"][:order] == "" || tenant_params[:tenant_details_attributes]["0"][:quantity] == "" || tenant_params[:tenant_details_attributes]["0"][:food_category_id] == "") 
          redirect_to :action => "new", notice: 'Tenant was not created. Please fill the meal_info'
      end
  end

# get the user feedback
  def user_feedback
    @feedback=[]
    tenant=UserFeedback.all.pluck(:tenant_id).uniq
    tenant.map do |tenant|
      @feedback << {:tenant_name => Tenant.find(tenant).name,:rat1 => UserFeedback.where(tenant_id: tenant, rating: "1").count,:rat2 => UserFeedback.where(tenant_id: tenant, rating: "2").count,:rat3 => UserFeedback.where(tenant_id: tenant, rating: "3").count,:rat4 => UserFeedback.where(tenant_id: tenant, rating: "4").count, :rat5 => UserFeedback.where(tenant_id: tenant, rating: "5").count}
    end
    
  end

# Check the Client Name Already Exists
  def check_clientname_present
    if Tenant.find_by(:name =>(params[:clientname_id])).present?
      msg = "Client Name already Exists"
    else
      msg = ""
    end
    render json: {"message"=> msg}
  end

# Get the Menu Item Detail for a particular date range
  def dynamic_client_menu
    @client = Tenant.find(params[:client_id])
    @client_categories = @client.tenant_details.pluck(:stud_type).uniq
    @menu_details = Tenant.filter_menu_cycle(params[:client_id], params[:start_date], params[:end_date], params[:meal_course_id])
    @start_date = params[:start_date]
    @end_date = params[:end_date]
    @meal_course_id = params[:meal_course_id]
  end

# Get Method For Assign Menu Page
  def assigned_menu

  end

# Send Email  Assigned Item Details to Client
  def mail_assigned_menu

      mailable_id = params[:mailable_id]
      @client = Tenant.find(params[:client_id])
      @client_categories = @client.tenant_details.pluck(:stud_type).uniq
      @menu_details = Tenant.filter_menu_cycle(params[:client_id], params[:start_date], params[:end_date], params[:meal_course_id])  
      pdf = render_to_string pdf: "Assigned_menu", template: "tenants/assigned_menu_pdf.html.erb", header:  { html: {template: 'tenants/header_pdf.html.erb'}, spacing: 3 }, footer:  { html: {template: 'tenants/footer_pdf.html.erb'} }, margin: {top: 70, bottom: 10, left: 0, right: 0}, encoding: "UTF-8"
      pdf_name = @client.name + "_" + Date.today.to_date.to_s + ".pdf"
        # then save to a file
      save_path = Rails.root.join('public', 'menu_pdfs', pdf_name)
      File.open(save_path, 'wb') do |file| 
        file << pdf
      end
      pdf_url = "#{Rails.root}/public/menu_pdfs/#{pdf_name}"
      if params[:email] == "false"
        
        grim_pdf   = Grim.reap(pdf_url)      
        count = grim_pdf.count
        img_name = @client.name + "_" + Date.today.to_date.to_s #+ ".png"   
        image_url = []                    
        grim_pdf.each_with_index do |value, index|
      
        #png   = grim_pdf[0].save("#{Rails.root}/public/menu_pdfs/#{img_name}") 
        png = value.save("#{Rails.root}/public/menu_pdfs/#{img_name}-#{index}"+ ".png")

        image_url.push("#{Rails.root}/public/menu_pdfs/#{img_name}-#{index}"+ ".png")
        end
        images = image_url
        processed_image = MiniMagick::Tool::Montage.new do |image|
            image.geometry "x1200+0+0"
            image.tile "#{images.size}x1"
            images.each {|i| image << i}
            image << "#{Rails.root}/public/menu_pdfs/#{img_name}_final.png"
        end 
        final_image = "#{Rails.root}/public/menu_pdfs/#{img_name}_final.png" 
        send_file(final_image, filename: img_name+".png", type: "image/png", disposition: "attachment")
      else
        TenantNotifierMailer.send_assigned_menu(pdf_url, mailable_id).deliver_now  
      end
    end
      

# Get the Quantity From MenuCycle based on Seletion

  def client_totalqty
      menu_cycle_ids = params[:menucycle_ids].split(",") if params[:menucycle_ids].present?
      @menu_cycle = MenuCycle.where(id: menu_cycle_ids)
      @date_choosen = params[:date_choosen]
  end

# Cook sheet Edit Option for QuantityEdit
  def cooksheet_item_edit
    @menu = MenuCycle.find(params["ids"].to_i).as_json(include: [:tenant_detail=>{include: :tenant}])
    @date_choosen = params[:date_choosen]
  end

  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tenant
      unless params[:id] == "undefined"
      @tenant = Tenant.find(params[:id])
    else
      redirect_to tenants_url
    end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tenant_params
       params.require(:tenant).permit(:name, :description, :color_code, :site_category_id, :latitude, :longitude,:sex, :from_date, :to_date,:email, :contact_person1, :contact_person2, :phone1, :phone2, :address, :gst_number, :exclude, :created_by, :updated_by, :active,:kitchen_id, :meal,image_attributes: [:id ,:image_path], tenant_details_attributes: [:id ,:tenant_id,:meal_time, :meal_restriction_id, :meal_plan, :age_type, :order, :quantity, :food_category_id, :cost, :stud_type, :_destroy,:feedback_code,:delivery_time,:dispatch_time,:spread_type])
    end

    def tenant_update_params
      params.require(:tenant).permit!
    end

   def tenant_data_params
       params.require(:tenant).permit(:name, :description, :color_code, :site_category_id, :latitude, :longitude,:sex, :from_date, :to_date,:email, :contact_person1, :contact_person2, :phone1, :phone2, :address, :exclude, :gst_number, :created_by, :updated_by, :active,:kitchen_id, :meal, :delivery_time,:dispatch_time,:spread_type, image_attributes: [:id ,:image_path])
    end
    
    def send_notification_email
        TenantUpdationMailer.send_updation_email(@tenant).deliver     
    end
 
   
end
