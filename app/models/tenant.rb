class Tenant < ApplicationRecord
  
  belongs_to :kitchen
  belongs_to :site_category
  belongs_to  :image
  has_many :customer_view_controls, :dependent => :destroy
  has_many :tenant_details,  :dependent => :destroy
  has_many :menu_customers,  :dependent => :destroy
  has_many :dispatches, dependent: :destroy  
  has_many :enrolments, dependent: :destroy  
  has_many :attendances,  :dependent => :destroy
  has_many :users,  :dependent => :destroy
  has_many :point_of_sales,  :dependent => :destroy
  has_many :parent_orders,  :dependent => :destroy
  has_many :student_feedbacks, dependent: :destroy
  accepts_nested_attributes_for :tenant_details, :allow_destroy => true
  accepts_nested_attributes_for :image, :allow_destroy => true  
  has_many :old_enrolments, dependent: :destroy  

  has_many :standards, dependent: :destroy
  #validates :phone1, format: { with: /\A\d+\z/, message: "Integer only. No sign allowed." }
    

  acts_as_paranoid


  def self.filter_menu_cycle(client_id, start_date, end_date, meal_course_id)
      tenant = Tenant.find(client_id.to_i) if client_id.present?
      category = Category.find(meal_course_id) if meal_course_id.present? && meal_course_id != "All"
      tenant_detail_ids = category.present? ? tenant.tenant_details.where(meal_time: category.category_name).ids : tenant.tenant_details.ids
      assigned_menu = MenuCycle.where(tenant_detail_id: tenant_detail_ids, date: start_date.to_date..end_date.to_date).order(:date)
      assigned_menu = assigned_menu.where(category_id: category.id) if category.present?
      menu_details = assigned_menu.order('category_id ASC').group_by(&:date)
      return menu_details
  end

   #  category = Category.find(params[:meal_course_id]) if params[:meal_course_id].present? && params[:meal_course_id] != "All"
   # tenant_detail_ids = category.present? ? @client.tenant_details.where(meal_time: category.category_name).ids : @client.tenant_details.ids
   #  @assigned_menu = MenuCycle.where(tenant_detail_id: tenant_detail_ids, date: params[:start_date].to_date..params[:end_date].to_date).order(:date)
   #  @assigned_menu = @assigned_menu.where(category_id: category.id) if category.present?
   #  @menu_details = @assigned_menu.group_by(&:date)


  def self.data_create(tenant_details_params, image_params, id)
    image = Image.new(image_params[:image_attributes])
    image.tenant_id = id
    image.save!
    tenant_details_params["tenant_details_attributes"].map do|kk|
        td = TenantDetail.new(kk.last)
        td.tenant_id = id
        td.save!
    end
  end

=begin
  def self.todaytenant(params) 

		kk=NormalmenuSite.where(date:Date.today).pluck(:tenant_id).uniq

		Tenant.where(id:kk).map{|pp|{:name=>pp.name}}
   
  end

=end
  def self.customer_report(params)
    out_data = Tenant.get_data(params)
    tenant = Tenant.find(params[:tenant][:id])
    from_date=tenant.from_date
    to_date=tenant.to_date
    p = Axlsx::Package.new

    sheet = p.workbook.add_worksheet(:name => "Customer Report")
    title = sheet.styles.add_style(:fg_color=>"#FF000000",:b => true,:alignment=>{:horizontal => :center})

    sheet.add_row ["From Date:", from_date.strftime("%d-%m-%Y"), "To Date:", to_date.strftime("%d-%m-%Y")], :style=>title
    sheet.add_row ["Date", "Customer", "Type", "Meal Time", "Meal Restriction", "Enrolled", "Not Enrolled", "Parent Orders", "Instant Orders", "Total Packs", "Actual consumed from Enrolled", "Actual consumed from Not Enrolled"], :style=>title
    out_data.each do |data|
      sheet.add_row [data[0], data[1], data[2], data[3], data[4], data[5], data[6], data[7], data[8], data[9], data[10], data[11]]
    end
    path = "#{Rails.root}/public/export_files/customer_report.xlsx"
    p.serialize(path)
    return path
  end

  def self.get_data(params)
    result = []
    tenant = Tenant.find(params[:tenant][:id])
    fromdate = params[:tenant][:from_date].to_date
    todate = params[:tenant][:to_date].to_date
    if fromdate <= tenant.from_date
      fromdate = tenant.from_date
    end
    if todate >= Date.today
      todate = Date.today
    end
    dates = (fromdate..todate).to_a
    dates.each do |dat|
      tenant.tenant_details.group_by{|e| [e.meal_time, e.meal_restriction_id, e.stud_type]}.map do |k, v| 
        qry = {date: dat, tenant_id: tenant.id, meal_time: k[0], meal_restriction_id: k[1], stud_type: k[2]} 
        attendances = Attendance.where(date: dat, tenant_id: tenant.id, meal_time: k[0], attendance_log: true)
        date = dat.strftime('%d-%m-%Y')
        tenant_name = tenant.name 
        meal_time = k[0] 
        meal_restriction_name = (k[1].present? ? MealRestriction.find(k[1]).meal_restriction_name : "Normal" )
        enroll = v.select { |e| e.order == "Enroll" }.pluck(:quantity).sum 
        not_enroll = v.select { |e| e.order == "Not-Enroll" }.pluck(:quantity).sum 
        parent_order = ParentOrder.where(qry).count 
        pos = PointOfSale.where(qry).pluck(:quantity).sum 
        menu_customer = MenuCustomer.find_by(tenant_id: tenant.id, date: dat, category_id: Category.find_by_category_name(k[0]), meal_restriction_id: k[1], stud_type: k[2]) 
        count1 = attendances.select { |e| e.enrolment.order_source == "Enrolled" and e.enrolment.meal_restriction_id == k[1]  if e.enrolment.present?}.count 
        count2 = attendances.select { |e| e.enrolment.order_source == "Not Enrolled" and e.enrolment.meal_restriction_id == k[1] if e.enrolment.present?}.count 
        
        enroll = (enroll != 0 ? enroll : "" )
        not_enroll = (not_enroll != 0 ? not_enroll : "")
        parent_order = (parent_order != 0 ? parent_order : "" )
        pos = (pos != 0 ? pos : "" )
        total_packs = (menu_customer.present? ? packs = menu_customer.packs_to_send : "" )
        count1 = (count1 == 0 ? "" : count1 )
        count2 = (count2 == 0 ? "" : count2 )
        result << [date, tenant_name, k[2], meal_time, meal_restriction_name, enroll, not_enroll, parent_order, pos, total_packs, count1, count2]
      end
    end
    return result  
  end


end
