class MenuCustomer < ApplicationRecord
  belongs_to :tenant
  belongs_to :menu_master
  belongs_to :category
  belongs_to :meal_restriction, optional: true
  
  has_many :menu_customer_dispatches, dependent: :destroy
  has_many :dispatches, through: :menu_customer_dispatches

  has_many :attendances, dependent: :destroy  
  has_many :parent_orders, dependent: :destroy
  has_many :delivery_histories, dependent: :destroy
  acts_as_paranoid

 require 'csv'
 require 'axlsx'

  # def self.filter_cook_sheet(data)
  #   selected_mealtypes = Category.where(id: data["mealtype"].reject(&:blank?)).pluck(:category_name) if data["mealtype"].present?
  #   tenant_filter_query = {}
  #   tenant_ids = Tenant.where(site_category_id: data["clienttype"].to_i).ids if data["clienttype"].present?
  #   tenant_filter_query.merge!(tenant_id: tenant_ids) if tenant_ids.present?
  #   # tenant_filter_query.merge!(stud_type: data["clienttype"]) if data["clienttype"].present?
  #   tenant_filter_query.merge!(tenant_id: data["clientname"].to_i) if data["clientname"].present?
  #   tenant_filter_query.merge!(meal_time: selected_mealtypes) if selected_mealtypes.present?
  #   tenantdetails = TenantDetail.where(tenant_filter_query) if tenant_filter_query != {}
  #   if tenant_filter_query.present?
  #     menu = MenuCycle.where(date: data["date"].to_date, tenant_detail_id: tenantdetails.ids).includes(:category).order('categories.position ASC').group_by(&:category_id) if tenantdetails.present?
  #   else
  #     menu = MenuCycle.where(date: data["date"].to_date).includes(:category).order('categories.position ASC').group_by(&:category_id)
  #   end
  #   return menu
  # end


  def history_mail	
  	MenuCustomer.history_mail
  end

  def self.summary(tenants)
    if tenants.present?
      temp = [] 
      @tenants = tenants
      (Date.today..Date.today+7).to_a.map do |dat|
        @tenants.map do |tenant|

          if dat <= tenant.to_date
            exclude_days = tenant.exclude
            case exclude_days
              when 1
                my_days = [0,1,2,3,4,5]
              when 2
                my_days = [1,2,3,4,5,6]
              when 3
                my_days = [1,2,3,4,5]
              else
                my_days = [0,1,2,3,4,5,6]
            end

            if my_days.include?(dat.wday)
                tenant.tenant_details.group_by{ |e| [e.meal_time, e.meal_restriction_id, e.stud_type] }.map do |k, v|
                qry = {date: dat, tenant_id: tenant.id, meal_time: k[0], meal_restriction_id: k[1], stud_type: k[2]}
                attendances = Attendance.where(date: dat, tenant_id: tenant.id, meal_time: k[0], attendance_log: true)
                menu_customer = MenuCustomer.find_by(tenant_id: tenant.id, date: dat, category_id: Category.find_by_category_name(k[0]), meal_restriction_id: k[1], stud_type: k[2])            
                dt = dat.to_date.strftime("%d-%m-%Y")
                od = (menu_customer.present? ? menu_customer.order_no : nil)
                tn_name = tenant.name
                ml_time = k[0]
                ml_rest = (k[1].present? ? MealRestriction.find(k[1]).meal_restriction_name : "Normal")
                enroll = v.select { |e| e.order == "Enroll" }.pluck(:quantity).sum.to_i
                not_enroll = v.select { |e| e.order == "Not-Enroll" }.pluck(:quantity).sum
                parent_order = ParentOrder.where(qry).count
                pos = PointOfSale.where(qry).pluck(:quantity).sum
                enroll = (enroll != 0 ? enroll : "")
                parent_order = (parent_order != 0 ? parent_order : "")
                pos = (pos != 0 ? pos : "")
                packs = (menu_customer.present? ? menu_customer.packs_to_send : "")               
                #packs = enroll + (parent_order.present? ? parent_order : 0) + (pos.present? ? pos : 0 )
                count1 = (attendances.select { |e| e.enrolment.order_source == "Enrolled" and e.enrolment.meal_restriction_id == k[1] }.select { |e| e.enrolment.stud_type == k[2] }.count)
                count2 = (attendances.select { |e| e.enrolment.order_source == "Not Enrolled" and e.enrolment.meal_restriction_id == k[1] }.select { |e| e.enrolment.stud_type == k[2] }.count)
                count1 = (count1 == 0 ? "" : count1)
                count2 = (count2 == 0 ? "" : count2)
                tm = v.first.meal_plan
                status = (menu_customer.present? ? menu_customer.delivery_status : "")

                temp << [dt, od, tn_name, k[2], ml_time, ml_rest, enroll, not_enroll, parent_order, pos, packs, count1, count2, tm, status]
              end
            end
          end
        end
      end
    end
    return temp
  end

  def self.menu_assign_index(tenants)
    if tenants.present?
      temp , id = [], [] 
      @tenants = tenants
      (Date.today..Date.today+7).to_a.map do |dat|
        @tenants.map do |tenant|
          if dat <= tenant.to_date
            exclude_days = tenant.exclude
            case exclude_days
              when 1
                my_days = [0,1,2,3,4,5]
              when 2
                my_days = [1,2,3,4,5,6]
              when 3
                my_days = [1,2,3,4,5]
              else
                my_days = [0,1,2,3,4,5,6]
            end

            if my_days.include?(dat.wday)
              tenant.tenant_details.group_by{ |e| [e.meal_time, e.meal_restriction_id, e.stud_type] }.map do |k, v|
                dt = dat.to_date.strftime("%d-%m-%Y")
                tn_name = tenant.name
                ml_time = k[0]
                ml_rest = (k[1].present? ? MealRestriction.find(k[1]).meal_restriction_name : "Normal")
                menu_customers = MenuCustomer.where(:tenant_id => tenant.id, :category_id => Category.find_by(category_name: k[0].strip).id, :date => dat, meal_restriction_id: k[1], stud_type: k[2])
                if menu_customers.present?
                  menus = menu_customers.map{|i| i.menu_master.menu_master_name}.join(", ")

                  id = menu_customers.ids
                  if menu_customers.where(:delivery_status => "Menu Planned").present?
                    menus = [menus]
                  else
                    menus = [menus, "Assigned"]
                  end
                else
                  menus = "Assign menu"
                end
                temp << [dt, tn_name, k[2], ml_time, ml_rest, menus,id]
              end
            end
          end
        end
      end
    end
    return temp
  end

 def self.file_generate(params)
    from_date = params["sheet"]["from_date"]
    to_date = params["sheet"]["to_date"]
    date = from_date == to_date ? [from_date] : (from_date..to_date).uniq
    final_result = []

    date.map do |date|
      @menu_customer = MenuCycle.where(date: date)
        if @menu_customer.present? 
          @menu_items = MenuCycle.daily_cook_sheet(date)
          final_result <<  @menu_items
        else    
          @menu_items = []
        end
    end
    p = Axlsx::Package.new

    sheet_name = params["sheet"]["cook_sheet"] ? "Cook Sheet" : "Customer Report"
    sheet = p.workbook.add_worksheet(:name => sheet_name)
    title = sheet.styles.add_style(:fg_color=>"#FF000000",:b => true,:alignment=>{:horizontal => :center})

    final_result.map do |result|
      sheet.add_row ["Date :",  result.first[:tenant][0][:date].to_date.strftime('%d-%m-%Y')],:style => title
        result.map do |menu|

     
          header = []
          header1 = []
            menu[:tenant].map do |head|
              header << [head[:tenant]+" - "+ClientCategory.find(head[:stud].to_i).name,""].flatten
              header1 << ["Qty","Total-"+head[:menus].flatten.first[:total].to_s].flatten


            end 
            sheet.add_row ["","",header].flatten
            #sheet.add_row header1.flatten

            sheet.add_row [menu[:tenant].first[:meal_time],"Total", header1.flatten].flatten,:style => title
            menu[:result].map do |val|
              if val[0] != ""
               val.insert(1,val.delete_at(-1))
               sheet.add_row val
              end
            end
        end
    end
   
    path = params["sheet"]["cook_sheet"] ? "#{Rails.root}/public/cook_sheet.xlsx" : "#{Rails.root}/public/customer_report.xlsx"
   # path = "#{Rails.root}/public/customer_report.xlsx"
    p.serialize(path)
    return path
  end

  


  def self.daily_transaction

    menucustomers = MenuCustomer.where(delivery_status:"packed",date:Date.today)
      if menucustomers.present?
        menucustomers.map do |item|
          items=item.menu_master.menu_production_items.map{|i| [ i.production_item.name , i.quantity ]}
          @transaction=DailyTransaction.new(date: Date.today,tenant_name: item.tenant.present? ? item.tenant.name : nil, category_name: item.category.present? ? item.category.category_name : nil, stud_type: item.stud_type,menu_master_name: item.menu_master.present? ? item.menu_master.menu_master_name : nil ,pack_to_send: item.packs_to_send, meal_restriction_name: item.meal_restriction.present? ? item.meal_restriction.meal_restriction_name : nil, food_category:item.menu_master.present? ? item.menu_master.food_category.name : nil , items: items.to_h)
          @transaction.save
        end
      end
  end

 
end
