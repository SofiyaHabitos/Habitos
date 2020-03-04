class MealCalendar < ApplicationRecord
  belongs_to :point_of_sale
  belongs_to :food_category
  validates :date, date: true

def self.bro(params)

  daterange = [];date=[]
  
  a=params[:select_period]

  user = User.find(params[:user_id])

  tn = user.tenant
  
  if a==0 

    date=NormalmenuSite.pluck(:date).uniq

  elsif a==1

    date=NormalmenuSite.where(:date=>params[:from_date] .. params[:to_date]).pluck(:date).uniq

  end

  day=NormalmenuSite.where(:tenant_id=>tn).order("date ASC").where(" date <= ?", Date.today).pluck(:date).uniq.count

	att_breakfast=Attendance.where(:date=>date,:meal_time=>"Breakfast",:tenant_id=>tn,attendance_log:true).ids.count

  pos_breakfast=PointOfSale.where(:date=>date,:meal_time=>"Breakfast",tenant_id:tn).pluck(:quantity).sum

  breakfast=att_breakfast+pos_breakfast


  att_lunch=Attendance.where(:date=>date,:meal_time=>"Lunch",:tenant_id=>tn,attendance_log:true).ids.count

  pos_lunch=PointOfSale.where(:date=>date,:meal_time=>"Lunch",tenant_id:tn).pluck(:quantity).sum

  lunch=att_lunch+pos_lunch


  att_dinner=Attendance.where(:date=>date,:meal_time=>"Dinner",:tenant_id=>tn,attendance_log:true).ids.count

  pos_dinner=PointOfSale.where(:date=>date,:meal_time=>"Dinner",tenant_id:tn).pluck(:quantity).sum

  dinner=att_dinner+pos_dinner



  #normal_pos=PointOfSale.where(:date=>date,:tenant_id=>tn,:meal_type=>"Normal_Menu").pluck(:quantity).sum

  totalpos=PointOfSale.where(:date=>date,:meal_time=>["Breakfast","Lunch","Dinner"],:meal_category=>["Veg","Non-Veg"],:meal_type=>"Normal_Menu",:tenant_id=>tn).pluck(:quantity).sum

  totalnormal=Attendance.where(:date=>date,:meal_time=>["Breakfast","Lunch","Dinner"],:meal_type=>["Veg","Non-Veg"],meal_log:"Normal_Menu",:tenant_id=>tn,attendance_log:true).pluck(:id).count

  totalcount=totalpos+totalnormal


  normalveg=Attendance.where(:date=>date,:meal_time=>["Breakfast","Lunch","Dinner"],:meal_type=>"Veg",meal_log:"Normal_Menu",:tenant_id=>tn,attendance_log:true).pluck(:id).count

  posveg=PointOfSale.where(:date=>date,:meal_time=>["Breakfast","Lunch","Dinner"],:meal_category=>"Veg",:meal_type=>"Normal_Menu",:tenant_id=>tn).pluck(:quantity).sum

  vegcount=normalveg+posveg


  normalnonveg=Attendance.where(:date=>date,:meal_time=>["Breakfast","Lunch","Dinner"],:meal_type=>"Non-Veg",meal_log:"Normal_Menu",:tenant_id=>tn,attendance_log:true).pluck(:id).count

  posnonveg=PointOfSale.where(:date=>date,:meal_time=>["Breakfast","Lunch","Dinner"],:meal_category=>"Non-Veg",:meal_type=>"Normal_Menu",:tenant_id=>tn).pluck(:quantity).sum

  nonvegcount=normalnonveg+posnonveg


  quantity=PointOfSale.where(:date=>date,:meal_time=>["Breakfast","Lunch","Dinner"],:meal_type=>"Normal_Menu",:tenant_id=>tn).pluck(:quantity).sum

  actual_quantity=PointOfSale.where(:date=>date,:meal_time=>["Breakfast","Lunch","Dinner"],:meal_type=>"Normal_Menu",:tenant_id=>tn).pluck(:actual_qty).sum


  contains=User.where("from_date <= ? AND to_date >= ?", Date.today, Date.today).where(age_type:["Teens","Child"],tenant_id:tn,meal_type:"Normal_Menu").pluck(:id).count

  primary=User.where("from_date <= ? AND to_date >= ?", Date.today, Date.today).where(age_type:"Teens",tenant_id:tn,meal_type:"Normal_Menu").pluck(:id).count

  secondary=User.where("from_date <= ? AND to_date >= ?", Date.today, Date.today).where(age_type:"Child",tenant_id:tn,meal_type:"Normal_Menu").pluck(:id).count

  absent=Attendance.where(:date=>date,attendance_log:false,tenant_id:tn).count

  #brea=Attendance.where(date:Date.today,attendance_log:false,meal_log:"Normal_Menu",meal_time:"Breakfast").count

  #lunchh=Attendance.where(date:Date.today,attendance_log:false,meal_log:"Normal_Menu",meal_time:"Lunch").count

  #dinne=Attendance.where(date:Date.today,attendance_log:false,meal_log:"Normal_Menu",meal_time:"Dinner").count

  daterange = [{:Total_Entrolled_Count=>NormalmenuSite.where(:tenant_id=>tn).count,:tenant=>tn.name,:Days_of_Nutrition=>day,:absent_count=>absent,:normal_menu=>{:breakfast=>breakfast,:lunch=>lunch,:dinner=>dinner,:total_count=>totalcount,:veg=>vegcount,:non_veg=>nonvegcount,:quantity=>{:quantity=>quantity,:actual_quantity=>actual_quantity},:count=>{:contains=>contains,:primary=>primary,:secondary=>secondary}}}]

  return daterange

end

def self.todaymenu(params)

  date=[] 

  user = User.find(params[:user_id])

  tn = user.tenant

  day=NormalmenuSite.where(:tenant_id=>tn).order("date ASC").where(" date <= ?", Date.today).pluck(:date).uniq.count

  if (NormalmenuSite.where(:tenant_id=>tn,date:Date.today).present?)
 
    dt= Date.today
  
  else
  
    dt = Date.tomorrow

  end

  data = [{:Total_Entrolled_Count=>NormalmenuSite.where(:tenant_id=>tn).count,:tenant=>tn.name,:Days_of_Nutrition=>day,:normal_menu=>tn.normalmenu_sites.where(:date=>dt).map{|pp| {:date=>pp.date,:meal_type=>pp.meal_type,:meal_time=>pp.meal_time,:normalmenu_count=>tn.attendances.where(:date=>dt).where(:meal_log=>true).count,:items=>pp.normal_menus.map{|ll| {:item_name=>ll.production_item.name,:quantity=>ll.quantity,:uom=>ll.unit_of_measurement.name,:nutrition=>{:calorie=>ll.nutrition.caloire,:protein=>ll.nutrition.protein,:fat=>ll.nutrition.fat}}}}}}]

  return data

end 

def self.piechart(params)

  piechart=[]

  #if params[:meal_time] == "Pos"

    #user = User.find(params[:user_id])

    #tn = user.tenant
        
    #normalcount=PointOfSale.where(:date=>params[:from_date] .. params[:to_date],:meal_type=>"Normal_Menu",:tenant_id=>tn.id)

    #optionalcount=PointOfSale.where(:date=>params[:from_date] .. params[:to_date],:meal_type=>"Optional_Menu",:tenant_id=>tn.id)

    #piechart = {:tenant=>tn.name,:normalmenu_pos_count=>{ :total_count=>normalcount.pluck(:quantity).sum, :veg=>normalcount.where(:meal_category=>"Veg").pluck(:quantity).sum, :non_veg=>normalcount.where(:meal_category=>"Non-Veg").pluck(:quantity).sum}}
    
  #else
          
    #user = User.find(params[:user_id])
        
    tn = Tenant.find(params[:tenant_id])

    day=NormalmenuSite.where(:tenant_id=>tn).order("date ASC").where(" date <= ?", Date.today).pluck(:date).uniq.count


    att_veg=Attendance.where(:date=>params[:from_date] .. params[:to_date]).where(:meal_time=>params[:meal_time],tenant_id:tn,meal_type:"Veg",attendance_log:true).ids.count

    pos_veg=PointOfSale.where(:date=>params[:from_date] .. params[:to_date]).where(:meal_time=>params[:meal_time],tenant_id:tn,meal_category:"Veg").pluck(:quantity).sum

    veg=att_veg+pos_veg  


    att_nonveg=Attendance.where(:date=>params[:from_date] .. params[:to_date]).where(:meal_time=>params[:meal_time],tenant_id:tn,meal_type:"Non-Veg",attendance_log:true).ids.count

    pos_nonveg=PointOfSale.where(:date=>params[:from_date] .. params[:to_date]).where(:meal_time=>params[:meal_time],tenant_id:tn,meal_category:"Non-Veg").pluck(:quantity).sum

    non_veg=att_nonveg+pos_nonveg

    total=veg+non_veg


    contains=User.where("from_date <= ? AND to_date >= ?", Date.today, Date.today).where(age_type:["Teens","Child"],tenant_id:tn,meal_type:"Normal_Menu").select{|i| i.meal_time.include?(params[:meal_time])}.pluck(:id).count

    primary=User.where("from_date <= ? AND to_date >= ?", Date.today, Date.today).where(age_type:"Teens",tenant_id:tn,meal_type:"Normal_Menu").select{|i| i.meal_time.include?(params[:meal_time])}.pluck(:id).count

    secondary=User.where("from_date <= ? AND to_date >= ?", Date.today, Date.today).where(age_type:"Child",tenant_id:tn,meal_type:"Normal_Menu").select{|i| i.meal_time.include?(params[:meal_time])}.pluck(:id).count

 
    date = params[:from_date]+".."+params[:to_date]

    count=Attendance.where(:date=>params[:from_date] .. params[:to_date],attendance_log:false,:meal_time=>params[:meal_time],tenant_id:tn).count
          
    piechart =[{:Total_Entrolled_Count=>NormalmenuSite.where(:tenant_id=>tn).count,:tenant=>tn.name,:Days_of_Nutrition=>day,:absent_count=>count,:date=>date,:meal_time=>params[:meal_time], :normal_menu=>{ :total_count=>total, :veg=>veg, :non_veg=>non_veg,:count=>{:contains=>contains,:primary=>primary,:secondary=>secondary}}}]
    
    return piechart

  #end

end

def self.calendar(params)

  calendar=[]

  user = User.find(params[:user_id])

  tn = user.tenant 
     
  date_range=NormalmenuSite.where(date:(Time.now + -1.month).strftime("%a,%d %b %Y") .. (Time.now + 1.month).strftime("%a,%d %b %Y")).pluck(:date).uniq

  #calendar = {:tenant=>tn.name,:month_wise_menu=>date_range.map{|month| {:month=>month.strftime("%B"),:normal_menu=>tn.normalmenu_sites.where(:date=>month).map{|pp| {:date=>pp.date}}}}}

  calendar = {:tenant=>tn.name,:date=>date_range}

  #calendar = {:tenant=>tn.name,:month_wise_menu=>date_range.map{|month| {:month=>month.strftime("%B"),:normal_menu=>tn.normalmenu_sites.where(:date=>month).map{|pp| {:date=>pp.date,:meal_time=>pp.meal_time,:meal_type=>pp.meal_type,:normalmenu_count=>tn.attendances.where(:date=>month).where(:meal_log=>true).count,:items=>pp.normal_menus.map{|ll| {:item_name=>ll.production_item.name,:quantity=>ll.quantity,:uom=>ll.unit_of_measurement.name}}}}}}}
  
  return calendar

  end

end

 #tn.attendances.where(:date=>params[:from_date] .. params[:to_date],tenant_id:tn,:user_id=>user).where(:meal_log=>true,attendance_log:true).uniq.pluck(:date)