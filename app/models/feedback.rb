class Feedback < ApplicationRecord
  
  belongs_to :tenant
  acts_as_paranoid

  #has_many :normal_menus

  def self.feed_back(params)

    if params[:type] == "feedback"

      site_id=NormalmenuSite.where(tenant_id:params[:tenant_id],date:params[:date]).ids
   		
   	  item_id=NormalMenu.where(normalmenu_site_id:site_id).pluck(:production_item_id)
     
      item_name=ProductionItem.where(id:item_id).pluck(:id,:name)

      feed_back={:Feedback=>{:age_type=>[{:id=>1,:key=>"Child"},{:id=>2,:key=>"Teens"},{:id=>3,:key=>"Adult"},{:id=>4,:key=>"Teacher"},{:id=>5,:key=>"Worker"},{:id=>6,:key=>"Others"}],:most_favourite_dish=>item_name,:least_favourite_dish=>item_name,:reason=>["Over-Cooked","Spicy","Salt","burned","So-watery"]}}

    elsif params[:type] == "review"

      tn=params[:tenant_id]

      totaldays=Feedback.where(:tenant_id=>tn).order("date ASC").where(" date <= ?", Date.today).pluck(:date).count

      numberofrating=Feedback.where(:tenant_id=>tn).order("date ASC").where(" date <= ?", Date.today).pluck(:rating)

      sumofraing=numberofrating.map(&:to_i).reduce(0, :+)

      averagerating=sumofraing/totaldays

      fromdate=Date.commercial(Date.today.year, -1+Date.today.cweek, 1)

      todate=Date.today

      totaldish=Feedback.where(date:fromdate .. todate).pluck(:favourite_dish)

      favourite=totaldish.group_by{ |e| e }.select { |k, v| v.size >=2 }.map(&:first)
      
      feed_back={:Numberofvotes=>totaldays,:Averagerating=>averagerating,:FavouriteDish=>favourite}
   
    end   
  	
  	return feed_back
  	
 	end

  def self.allow()
   if Feedback.where(:flag=>nil,:date=>"2017-07-24").present?
    f_back=Feedback.where(:flag=>nil,:date=>"2017-07-24")
     f_back.map{|feed| feed.update(:flag=>1)}
    end
  end




def self.feedback_report(params)
  out_data = Feedback.get_data(params)
    p = Axlsx::Package.new
    p.workbook.add_worksheet(:name => "Food Return Report") do |sheet|
      sheet.add_row ["Date", "Tenant", "User Name", "Age Type", "FavouriteDish", "LeastDish", "Comments","Rating","Reason"]
      out_data.each do |data|
        sheet.add_row [data[0], data[1], data[2], data[3], data[4], data[5], data[6], data[7], data[8]]
      end
    end
    path = "#{Rails.root}/public/export_files/food_return_report.xlsx"
    p.serialize(path)
    return path

end


=begin
def self.feedback_report(params)
    out_data = FoodReturn.get_data(params)
    p = Axlsx::Package.new
    p.workbook.add_worksheet(:name => "Food Return Report") do |sheet|
      sheet.add_row ["Date", "Tenant", "Meal Time", "Menu Item", "Return Qty", "Reason", "Comment"]
      out_data.each do |data|
        sheet.add_row [data[0], data[1], data[2], data[3], data[4], data[5], data[6]]
      end
    end
    path = "#{Rails.root}/public/export_files/food_return_report.xlsx"
    p.serialize(path)
    return path   
  end
=end

  def self.get_data(params)
    result = []
    feedbacks = Feedback.where(tenant_id: params["tenant"]["id"],date: (params["tenant"]["from_date"]..params["tenant"]["to_date"]),status: "Approved" )
    feedbacks.map do |fb|
    result << [fb.date.strftime('%d-%m-%Y'), fb.tenant.name, fb.username, fb.age_type,fb.favourite_dish,fb.least_dish,fb.comment,fb.rating,fb.reason]  
  end
    return result   
  end

end


#date=Feedback.where(:tenant_id=>4).order("date ASC").where(" date <= ?", Date.today).pluck(:date).uniq.count

#mm=Feedback.where(:tenant_id=>4).order("date ASC").where(" date <= ?", Date.today).pluck(:rating)

#kk=mm.map(&:to_i).reduce(0, :+)

#aa=kk/date

#date.group_by{ |e| e }.select { |k, v| v.size >=3 }.map(&:first)


#fromdate=Date.commercial(Date.today.year, -1+Date.today.cweek, 1)

#todate=Date.today

#kk=Feedback.where(date:fromdate .. todate).pluck(:favourite_dish)

#kk.group_by{ |e| e }.select { |k, v| v.size >=2 }.map(&:first)


