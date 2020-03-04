class VesselplannersController < ApplicationController
  def index
    @tenant = Tenant.all
    @a= Vesselplanner.new
  end

  def assigned_vessel
    @assign_vessel = Vesselplanner.where( date: params["assignvessel"].present? ? params["assignvessel"]["date"] : Date.today).pluck(:tenant_detail_id) 
    assigned_vessel = TenantDetail.where(id: @assign_vessel).pluck(:tenant_id)
    @vessel = Tenant.where(id: assigned_vessel).pluck(:name ,:id)
  end

  def vessel_tenantdetail
    @q= TenantDetail.where(tenant_id: params[:format] ).pluck(:id) 
    @vesseltenant =Vesselplanner.where(date: params["date"] , tenant_detail_id: @q).includes(:tenant_detail).group_by(&:tenant_detail_id)
  end
    
  def details
    #@utensilname =[]
    #@utensilname = Utensil.where(utensils_category_id: params["id"]).pluck(:utensil_name)
    @tenant_details = MenuCycle.where(tenant_id: params["id"],date: params["date"],status: nil)
    #@tenant_id =Menucycle.pluck(:tenant_id).uniq
    #@tenant_detailid1=  TenantDetail.where(tenant_id: @tenant_id , stud_type: "Secondary" ,  spread_type: "5 Spread").pluck(:id)
  end

  def utensilname
    #@utensilname =[]
    @utensilname = Utensil.where(utensils_category_id: params["id"] ,asset_status: "Dispatch Asset" ).pluck( :utensil_name , :id)
  end
   
  def create
    a=Vesselplanner.vessel(params)
    #redirect_to vesselplanners_index_path
    #render :index
  end

  def delete
    deletevessel = Vesselplanner.where(utensil_id: params["id"])
    deletevessel.destroy_all
  end
    
  def tenantdetails
    @filtertenant= MenuCycle.where(date: params["id"],status: nil).includes(:tenant)
  end

  def edit
    @vesselten = Vesselplanner.find_by(id: params[:format])
  end

  def update
     @vesselten = Vesselplanner.find_by(id:  params["vesselplanner"]["id"])
  end
 
 #new vesselplanner
  def new  
  end

  def new1
   value = params["vessel"].present? ? "vessel" : params["id"].present? ? "id" : "normal"

  @spread_type_response = JSON.parse RestClient.get("#{$pim_core_service}/pimcore/api/FoodRecepie/SpreadName")


    @planned = MenuCycle.where(date: (Date.today..Date.today+1.day), status: "Planned")
    @unplanned = MenuCycle.where(date: (Date.today..Date.today+1.day), status: nil)

    case value
    when "vessel"
        @menucycle , @utensilname = [], []
      
        # tdetail = TenantDetail.find_by(stud_type: params["vessel"]["studtype"], spread_type: params["vessel"]["spreadtype"],meal_time: Category.find(params["vessel"]["mealcourse"]).category_name,tenant_id: params["vessel"]["clientname"])
        tdetail = TenantDetail.where(meal_time: Category.find(params["vessel"]["mealcourse"]).category_name,tenant_id: params["vessel"]["clientname"])
          
        unless tdetail.nil?
        @menucycle = MenuCycle.where(date: params["vessel"]["date"],tenant_detail_id: tdetail.ids ,status: nil)
        @dropdown = MenuCycle.where(date: params["vessel"]["date"],tenant_detail_id: tdetail.ids,status: nil)
        #@utensilname = Utensilname.pluck(:name,:id)

        @ids=Utensil.where(asset_type: "Transit",tracking: "Inhouse").pluck(:utensilname_id)
        @utensilname = Utensilname.where(id: @ids).pluck(:name,:id)

        end

    when "id"
       @index = Vesselplanner.where(id: params["id"]) if params["id"].present?
       @dropdown = MenuCycle.where(date: @index.last.date,tenant_detail_id: @index.last.tenant_detail_id,status: "Planned")  if @index.present? && @index.last.date.present? 
    else
        @index = []
        @menucycle = nil
        unplanned =TenantDetail.pluck(:id)
        planned = Vesselplanner.pluck(:tenant_detail_id)
    end


  end

  def index1
    tenant_detail = TenantDetail.where(id: params["tenant_detail_id"].uniq)
    MenuCycle.where(tenant_detail_id: tenant_detail.ids ,date: params["date"]).update(status: "Planned")
 
    keys=params["menu_items"]
    values=params["qty"].present? ?params["qty"] : "0" 
    menu = [keys.map(&:to_s), values.map(&:to_s),params["tenant_detail_id"]].transpose

    menu.each_with_index do |i,index|
      if MenuCycle.where(tenant_detail_id: i[2].to_i,date: params["date"],status: "Planned").last.menu_items.select{|j| j["name"]== i[0]}.present?
      menu_item = MenuCycle.where(tenant_detail_id: i[2].to_i,date: params["date"],status: "Planned").last.menu_items.select{|j| j["name"]== i[0]}[0]
     menu_item["qty"] = i[1]
     @vesseldetails = Vesselplanner.create( menuitem: menu_item, date: params["date"],utensil_id: Utensil.find_by(utensilname_id: params["utensilname"][index].to_i).id, tenant_detail_id: i[2].to_i, tag_id: params["tag_id"][index].to_i)
     @vesseldetails.tag.update(status: "Assigned")
     @vessel = Vesselplanner.where(date: params["date"],tenant_detail_id: tenant_detail.ids,tag_id: params["tag_id"])
  
    end
    end
    redirect_to vesselplanners_new1_path(id: @vessel.pluck(:id))        #count_dummy= Utensil.where(utensilname_id: params["utensilname"]).pluck(:count_dummy)       #count_dummy= Utensil.where(utensilname_id: params["utensilname"]).pluck(:count_dummy)
  end
  
  def dropdown

    tenantname = Tenant.where(site_category_id: params["val"]).pluck(:name,:id)
    client_type = SiteCategory.find(params["val"])
    spread_type_ids = client_type.client_spread_types.pluck(:spread_type_id).join(",")
    spread_type_response = RestClient.get("#{$pim_core_service}/pimcore/api/FoodRecepie/SpreadName?id="+spread_type_ids)
    spread_data = JSON.parse(spread_type_response)
    @Client= {client_categories: client_type.client_categories, Spread: spread_data["Spread"], Tenant: tenantname }

  end

  def dropdown1
    tenantname = Tenant.where(site_category_id: params["val"]).pluck(:name,:id)
    client_type = SiteCategory.find(params["val"])
    spread_type_ids = client_type.client_spread_types.pluck(:spread_type_id).join(",")
    spread_type_response = RestClient.get("#{$pim_core_service}/pimcore/api/FoodRecepie/SpreadName?id="+spread_type_ids)
    spread_data = JSON.parse(spread_type_response)
    @Client= {client_categories: client_type.client_categories, Spread: spread_data["Spread"], Tenant: tenantname }

    #@tenantname = Tenant.where(site_category_id: params["val"]).pluck(:name,:id)
  end

  def vessel_dispatch

      today_plan_ids = Vesselplanner.where(date: Date.today).pluck(:tenant_detail_id).uniq
      today_dis_ids = VesselDispatch.where(date: Date.today).pluck(:tenant_detail_id).uniq
      today_planned = today_dis_ids
      today_unplanned = today_plan_ids - today_dis_ids

      tmrw_plan_ids = Vesselplanner.where(date: Date.today+1).pluck(:tenant_detail_id).uniq
      tmrw_dis_ids = VesselDispatch.where(date: Date.today+1).pluck(:tenant_detail_id).uniq
      tmrw_planned = tmrw_dis_ids
      tmrw_unplanned = tmrw_plan_ids - tmrw_dis_ids
      
      @vessel_dispatch = nil

    @planned = MenuCycle.where(date: Date.today, status: "Planned",tenant_detail_id: today_planned) + MenuCycle.where(date: Date.today+1, status: "Planned",tenant_detail_id: tmrw_planned)
    @unplanned = MenuCycle.where(date: Date.today, status: "Planned",tenant_detail_id: today_unplanned) + MenuCycle.where(date: Date.today+1, status: "Planned",tenant_detail_id: tmrw_unplanned)

    @sitecategory = SiteCategory.pluck(:name,:id)
    @tenant = Tenant.pluck(:name, :id)
    @category = Category.all.order('position').pluck(:category_name)
    @foodcategory = FoodCategory.pluck(:name,:id)

    @spread_type_response = JSON.parse RestClient.get("#{$pim_core_service}/pimcore/api/FoodRecepie/SpreadName")
       
      
    if params['dispatch'].present?  
    
      @client = TenantDetail.where(tenant_id: params["dispatch"]["clientname"], meal_time: params["dispatch"]["mealcourse"])
      @vesselplanner = VesselDispatch.where(date: params["dispatch"]["date"],tenant_detail_id: @client.ids)
    
      if @vesselplanner.present?
        @vessel_dispatch = VesselDispatch.where(date: params["dispatch"]["date"],tenant_detail_id: @client.ids)
      else
        @vessel_dispatch = Vesselplanner.where(date: params["dispatch"]["date"],tenant_detail_id: @client.ids)
      end
      @old_value =@vessel_dispatch.pluck(:tag_id)
      @tags = Tag.where(id: @old_value+Tag.where(status: nil))
      @ids=Utensil.where(tracking: "Inhouse",asset_type: "Transit").pluck(:utensilname_id)
      @utensilname = Utensilname.where(id: @ids).pluck(:name,:id)
      @dropdown = MenuCycle.where(date: params["dispatch"]["date"],tenant_detail_id: @client , status: "Planned")
    end
    if params["id"].present? 

     @dispatched = VesselDispatch.where(id: params["id"])
     @dropdown = MenuCycle.where(date: @dispatched.last.date,tenant_detail_id: @dispatched.last.tenant_detail_id,status: "Planned")
    end
  end


  def status
      @kitchen = Kitchen.all.order('name').pluck(:name,:id)
      @asset_status = Assetstatus.where(utensilname_id: params["id"]).where.not(status: "Inhouse").order(:date)
  end

  def status_register_edit
    asset_status_id = params[:asset_status_id].to_i if params[:asset_status_id].present?
    @asset_status = Assetstatus.find(asset_status_id)
  end

  def update_status
      if params["status"]["asset_status_id"].present?
        status = Assetstatus.find_or_initialize_by(id: params["status"]["asset_status_id"])
        status.update_attributes!(date: params["status"]["date"], utensilname_id: params["status"]["utensilname_id"].to_i, kitchen_id: params["status"]["kitchen_id"].to_i, count: params["status"]["count"].to_i, status: params["status"]["Status"])
        unless params["status"]["movable_count"].to_i == 0
          moved_asset = Assetstatus.where(date: Date.today.to_date, utensilname_id: params["status"]["utensilname_id"].to_i, kitchen_id: params["status"]["kitchen_id"].to_i, status: params["status"]["movable_status"])
          unless moved_asset.present?
            Assetstatus.create(date: params["status"]["movable_date"].to_date, utensilname_id: params["status"]["utensilname_id"].to_i, kitchen_id: params["status"]["kitchen_id"].to_i, count: params["status"]["movable_count"].to_i, status: params["status"]["movable_status"])
          else
            moved_asset.first.update_attributes!(count: moved_asset.count.to_i + params["status"]["movable_count"].to_i)
          end
        end
        
      else
        status = Assetstatus.find_or_initialize_by(id: params["status"]["asset_status_id"])
        status.update_attributes!(date: params["status"]["date"],utensilname_id: params["status"]["Utensilname"].to_i,kitchen_id: params["status"]["From"].to_i,status: params["status"]["Status"],count: params["count"])
      end
      status_count = Assetstatus.where(utensilname_id: status.utensilname_id).where.not(status: "Inhouse").pluck(:count).sum
      utensil = Utensil.find_by(utensilname_id: status.utensilname_id)
      bal = utensil.count - status_count
      utensil.update(count_dummy: bal)
      redirect_to vesselplanners_status_path(id: status.utensilname_id)  
  end 


  def dispatched

    keys = params["item"]
    values = params["qty"]

    menu = [keys.map(&:to_s), values.map(&:to_s),params["tenantdetail"]].transpose if params["tenantdetail"].present?
   
    menu.each_with_index do |i,index|
     
    menu_item = MenuCycle.where(tenant_detail_id: i[2].to_i,date: params["date"],status: "Planned").last.menu_items.select{|j| j["name"]== i[0]}[0]

      menu_item["qty"] = i[1] 
     @vs = VesselDispatch.find_by(date: params["date"], utensil_id: Utensil.find_by(utensilname_id: params["utensil_id"][index].to_i).id,tenant_detail_id: i[2].to_i,tag_id: params["tag_id"][index].to_i)
    
    if @vs.present? 
      
      @vs.update(date: params["date"], menuitem: menu_item, utensil_id: Utensil.find_by(utensilname_id: params["utensil_id"][index].to_i).id,tenant_detail_id: i[2].to_i,tag_id: params["tag_id"][index].to_i)
     # wastage: params["wastage"].map(&:to_f)[index]
      @dispatch = @vs
     else
      
     @dispatch = VesselDispatch.create(date: params["date"], menuitem: menu_item, utensil_id:Utensil.find_by(utensilname_id: params["utensil_id"][index].to_i).id,tenant_detail_id: i[2].to_i,tag_id: params["tag_id"][index].to_i)
     #,wastage: params["wastage"].map(&:to_f)[index]
     end

     @dispatch.tag.update(status: "Dispatched")

     dispatch_count = Tag.where(utensil_id: @dispatch.utensil_id, status: "Dispatched").count

     utensil = Utensil.find(@dispatch.utensil_id) if @dispatch.utensil_id.present?

     utensil.update!(count_dummy: utensil.count - dispatch_count) if utensil.present?

     @dispatched = VesselDispatch.where(date: params["date"], tenant_detail_id: params["tenantdetail"].uniq,tag_id: params["tag_id"])
    end
    redirect_to vesselplanners_vessel_dispatch_path(id: @dispatched.pluck(:id))
end

  def download_vessel_pdf
    pdf = VesselDispatch.select(params)
    send_file pdf,disposition: 'inline'
  end
  
  def save_pdf 
  #   data = VesselDispatch.select(params)
  #   encode = Base64.encode64(File.open("#{data}").read)
  # 
  # raw_pdf_str = Base64.decode64 encoded_string
  # render :text, raw_pdf_str
    #decode = Base64.decode64(encode)
  #  save = "#{Rails.root}/dcprint/#{decode}"
  end

  def utensil_reallocation
    vessel_planner = Vesselplanner.find(params["planner_id"].to_i) if params["planner_id"].present?  && params["planner_id"].to_i != 0
    new_tag = Tag.find(params["new_tag_id"].to_i) if params["new_tag_id"].present? && params["new_tag_id"].to_i != 0
    new_utensil = Utensilname.find(params["new_utensil_id"].to_i).utensils.first if params["new_utensil_id"].present? && params["new_utensil_id"].to_i != 0
    vessel_planner.tag.update!(status: nil) if vessel_planner.present? && vessel_planner.tag.present?
    new_tag.update!(status: "Assigned") if new_tag.present?
    vessel_planner.update!(tag_id: new_tag.id, utensil_id: new_utensil.id) if vessel_planner.present? && new_tag.present? && new_utensil.present?
    @tags = vessel_planner.utensil.tags if vessel_planner.present? &&  vessel_planner.utensil.present?
    render json: @tags
  end
        
  def vessel_wastage

    today_plan_ids = Vesselplanner.where(date: Date.today).pluck(:tenant_detail_id).uniq
    today_dis_ids = VesselDispatch.where(date: Date.today).pluck(:tenant_detail_id).uniq
    today_planned = today_dis_ids

    tmrw_plan_ids = Vesselplanner.where(date: Date.today+1).pluck(:tenant_detail_id).uniq
    tmrw_dis_ids = VesselDispatch.where(date: Date.today+1).pluck(:tenant_detail_id).uniq
    tmrw_planned = tmrw_dis_ids

    @planned = MenuCycle.where(date: Date.today, status: "Planned",tenant_detail_id: today_planned) + MenuCycle.where(date: Date.today+1, status: "Planned",tenant_detail_id: tmrw_planned)

    # td_id = @planned.pluck(:tenant_detail_id)
    
    # if VesselDispatch.find_by(tenant_detail_id: td_id).wastage.present? 
    #   @wasted = VesselDispatch.find_by(date: Date.today,tenant_detail_id: td_id)
    # else
    #   @wasted = VesselDispatch.find_by(date: Date.today,tenant_detail_id: td_id)
    # end

    @spread_type_response = JSON.parse RestClient.get("#{$pim_core_service}/pimcore/api/FoodRecepie/SpreadName")

    @tenant = Tenant.pluck(:name, :id)
    @category = Category.all.order('position').pluck(:category_name)

    if params['dispatch'].present? 

      @client = TenantDetail.where(tenant_id: params["dispatch"]["clientname"], meal_time: params["dispatch"]["mealcourse"])

      @vesseldispatch = VesselDispatch.where(date: params["dispatch"]["date"],tenant_detail_id: @client.ids)

      @old_value = @vesseldispatch.pluck(:tag_id)
      @tags = Tag.where(id: @old_value+Tag.where(status: nil))
      @ids = Utensil.where(tracking: "Inhouse",asset_type: "Transit").pluck(:utensilname_id)
      @utensilname = Utensilname.where(id: @ids).pluck(:name,:id)
      @dropdown = MenuCycle.where(date: params["dispatch"]["date"],tenant_detail_id: @client,status: "Planned")

    end  
    
    if params["id"].present?
     @wasted = VesselDispatch.where(id: params["id"])
     @dropdown = MenuCycle.where(date: @wasted.last.date,tenant_detail_id: @wasted.last.tenant_detail_id,status: "Planned")
    end
    
    # @dropdown = MenuCycle.where(date: params["dispatch"]["date"],tenant_detail_id: @client , status: "Planned")

  end  

  def wasted

    keys = params["item"]
    values = params["qty"]

    menu = [keys.map(&:to_s), values.map(&:to_s),params["tenantdetail"]].transpose if params["tenantdetail"].present?
   
    menu.each_with_index do |i,index|
     
      menu_item = MenuCycle.where(tenant_detail_id: i[2].to_i,date: params["date"],status: "Planned").last.menu_items.select{|j| j["name"]== i[0]}[0]

      menu_item["qty"] = i[1] 

      @vs = VesselDispatch.find_by(date: params["date"], utensil_id: Utensil.find_by(utensilname_id: params["utensil_id"][index].to_i).id,tenant_detail_id: i[2].to_i,tag_id: params["tag_id"][index].to_i)

      if @vs.present?

        @vs.update(date: params["date"], menuitem: menu_item, utensil_id:Utensil.find_by(utensilname_id: params["utensil_id"][index].to_i).id,tenant_detail_id: i[2].to_i,wastage: params["wastage"].map(&:to_f)[index],tag_id: params["tag_id"][index].to_i)

        @dispatch = @vs

      else

        @dispatch = VesselDispatch.create(date: params["date"], menuitem: menu_item, utensil_id:Utensil.find_by(utensilname_id: params["utensil_id"][index].to_i).id,tenant_detail_id: i[2].to_i,tag_id: params["tag_id"][index].to_i)
     #,wastage: params["wastage"].map(&:to_f)[index]
      end

     @dispatch.tag.update(status: "Dispatched")

     dispatch_count = Tag.where(utensil_id: @dispatch.utensil_id, status: "Dispatched").count

     utensil = Utensil.find(@dispatch.utensil_id) if @dispatch.utensil_id.present?

     utensil.update!(count_dummy: utensil.count - dispatch_count) if utensil.present?

     @wasted = VesselDispatch.where(date: params["date"], tenant_detail_id: params["tenantdetail"].uniq,tag_id: params["tag_id"])
     
    end

    redirect_to vesselplanners_vessel_wastage_path(id: @wasted.pluck(:id))
    

  end         

end

