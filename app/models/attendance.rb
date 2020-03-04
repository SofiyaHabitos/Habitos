class Attendance < ApplicationRecord

require 'csv'

  belongs_to :tenant

  belongs_to :enrolment

  belongs_to :menu_customer#, optional: true

  belongs_to :user, optional: true

  belongs_to :food_category

  validates :meal_time, :identity_number, presence: true
  acts_as_paranoid

=begin
    def self.todayattendance(params)

  		todayattendance=[]

  	 	user = User.find(params[:user_id])
        
  		tn = user.tenant

  		if params[:type] == "dense"

        breakfastuser=User.where("from_date <= ? AND to_date >= ?", Date.today, Date.today).where(tenant_id:tn).select{|i| i.meal_time.include?("Breakfast")}.pluck(:id)

        brk_entroll=breakfastuser.count

        brea=User.where(id:breakfastuser).pluck("name","identity_number")

        brk_type=NormalmenuSite.where(date:Date.today,meal_time:"Breakfast",tenant_id:tn).pluck(:meal_type)


        lunchuser=User.where("from_date <= ? AND to_date >= ?", Date.today, Date.today).where(tenant_id:tn).select{|i| i.meal_time.include?("Lunch")}.pluck(:id)

        lun_entroll=lunchuser.count

        lunc=User.where(id:lunchuser).pluck("name","identity_number")

        lun_type=NormalmenuSite.where(date:Date.today,meal_time:"Lunch",tenant_id:tn).pluck(:meal_type)


        dinneruser=User.where("from_date <= ? AND to_date >= ?", Date.today, Date.today).where(tenant_id:tn).select{|i| i.meal_time.include?("Dinner")}.pluck(:id)

        din_entroll=dinneruser.count

        dinn=User.where(id:dinneruser).pluck("name","identity_number")

        dinn_type=NormalmenuSite.where(date:Date.today,meal_time:"Dinner",tenant_id:tn).pluck(:meal_type)


        brk_total=Attendance.where(date:Date.today,meal_time:"Breakfast",tenant_id:tn).count

        lun_total=Attendance.where(date:Date.today,meal_time:"Lunch",tenant_id:tn).count

        din_total=Attendance.where(date:Date.today,meal_time:"Dinner",tenant_id:tn).count

        brk_present=Attendance.where(date:Date.today,meal_time:"Breakfast",tenant_id:tn,attendance_log:true).count

        lun_present=Attendance.where(date:Date.today,meal_time:"Lunch",tenant_id:tn,attendance_log:true).count

        din_present=Attendance.where(date:Date.today,meal_time:"Dinner",tenant_id:tn,attendance_log:true).count

        brk_absent=Attendance.where(date:Date.today,meal_time:"Breakfast",tenant_id:tn,attendance_log:false).uniq.pluck(:user_id)

        lun_absent=Attendance.where(date:Date.today,meal_time:"Lunch",tenant_id:tn,attendance_log:false).uniq.pluck(:user_id)

        din_absent=Attendance.where(date:Date.today,meal_time:"Dinner",tenant_id:tn,attendance_log:false).uniq.pluck(:user_id)


        brk1_total=Attendance.where(date:Date.yesterday,meal_time:"Breakfast",tenant_id:tn).count

        lun1_total=Attendance.where(date:Date.yesterday,meal_time:"Lunch",tenant_id:tn).count

        din1_total=Attendance.where(date:Date.yesterday,meal_time:"Dinner",tenant_id:tn).count

        brk1_present=Attendance.where(date:Date.yesterday,meal_time:"Breakfast",tenant_id:tn,attendance_log:true).count

        lun1_present=Attendance.where(date:Date.yesterday,meal_time:"Lunch",tenant_id:tn,attendance_log:true).count

        din1_present=Attendance.where(date:Date.yesterday,meal_time:"Dinner",tenant_id:tn,attendance_log:true).count

        brk1_absent=Attendance.where(date:Date.yesterday,meal_time:"Breakfast",tenant_id:tn,attendance_log:false).count

        lun1_absent=Attendance.where(date:Date.yesterday,meal_time:"Lunch",tenant_id:tn,attendance_log:false).count

        din1_absent=Attendance.where(date:Date.yesterday,meal_time:"Dinner",tenant_id:tn,attendance_log:false).count

  	   todayattendance=[{:tenant=>tn.name,:date=>Date.today,:Breakfast=>{:username=>brea,:meal_type=>brk_type,:absent=>brk_absent.count,:absentlist=>User.where(id:brk_absent).pluck(:name,:identity_number),:entroll=>brk_entroll,:meal_time=>"Breakfast"},:Lunch=>{:username=>lunc,:meal_type=>lun_type,:absent=>lun_absent.count,:absentlist=>User.where(id:lun_absent).pluck(:name,:identity_number),:entroll=>lun_entroll,:meal_time=>"Lunch"},:Dinner=>{:username=>dinn,:meal_type=>dinn_type,:absent=>din_absent.count,:absentlist=>User.where(id:din_absent).pluck(:name,:identity_number),:entroll=>din_entroll,:meal_time=>"Dinner"},:Today=>{:date=>Date.today,:meal_time=>"Breakfast",:total_breakfast=>brk_total,:breakfast_present=>brk_present,:meal_time1=>"Lunch",:total_lunch=>lun_total,:lunch_present=>lun_present,:meal_time2=>"Dinner",:total_dinner=>din_total,:dinner_present=>din_present},:Yesterday=>{:date=>Date.yesterday,:meal_time1=>"Breakfast",:yesterdaytotal_breakfast=>brk1_total,:yesterday_present=>brk1_present,:yesterdaymeal_time=>"Lunch",:yesterdaytotal_lunch=>lun1_total,:yesterdaylunch_present=>lun1_present,:yesterdaymeal_time2=>"Dinner",:yesterdaytotal_dinner=>din1_total,:yesterdaydinner_present=>din1_present}}]

      elsif params[:type] == "lite"  

        date=Attendance.where(date:params[:from_date] .. params[:to_date],tenant_id:tn).uniq.pluck(:date)

        todayattendance=[{:attendance_details=>{:username=>user.name,:id=>user.identity_number,:age_type=>user.age_type,:class=>user.standard,:meal_time=>user.meal_type,:entrollment_days=>(Date.today - User.find(user).from_date).to_i,:mealmissing_count=>Attendance.where(tenant_id:tn,user_id:user,attendance_log:false).count}}]

      end

  		return todayattendance
  
    end	
=end
	def self.export
  	
  	columns=["user_id","tenant_id","identity_number","age_type","standard", "date", "attendance_log", "meal_log","meal_time", "meal_type"]
  	
  	CSV.open("#{Rails.root}/public/files/Attendanceexport.csv",'w') do |csv|
    
     	csv << columns.map{|aa|aa.humanize}
     
   		all.each do |product|
       
       	mm=product.attributes.values_at(*columns)
       
     		mm[0]=product.user.name
       	
     		mm[1]=product.tenant.name
       
     		csv << mm
     	
   		end
    		
   	end

	end
=begin
  def self.nutrition(params)

    nutrition=[]

    user=User.find(params[:user_id])
 
    tn=user.tenant
 
    menu_id=NormalmenuSite.where(date:params[:from_date] .. params[:to_date],tenant_id:tn).uniq.ids

    menu_id1=Attendance.where(normalmenu_site_id:menu_id,user_id:user,attendance_log: true, meal_log: "Normal_Menu").pluck(:normalmenu_site_id)
 
    data=NormalMenu.where(normalmenu_site_id:menu_id1).map{|ll| {:nutrition=>{:calorie=>ll.nutrition.caloire,:protein=>ll.nutrition.protein,:fat=>ll.nutrition.fat,:carbohydrates=>ll.nutrition.carbohydrates,:calcium=>ll.nutrition.calcium,:fibre=>ll.nutrition.fibre}}}
 
    @cal=[],@pro=[],@fat=[],@fat=[],@car=[],@calc=[],@fib=[]

    count=data.count

    (0..count-1).map{|i| @cal << data[i][:nutrition][:calorie];@pro << data[i][:nutrition][:protein];@fat << data[i][:nutrition][:fat];@car << data[i][:nutrition][:carbohydrates];@calc << data[i][:nutrition][:calcium];@fib << data[i][:nutrition][:fibre]}
 
    nutrition={:meal_count=>menu_id.count,:calorie=>@car.sum+@fib.sum+@fat.sum+@pro.sum+@calc.sum,:go=>{:carbohydrates=>@car.sum,:fibre=>@fib.sum,:fat=>@fat.sum},:grow=>{:protein=>@pro.sum,:calcium=>@calc.sum},:glow=>{:vitamins=>80,:minerals=>20}}
    
    return nutrition

  end

=end

end

#

 