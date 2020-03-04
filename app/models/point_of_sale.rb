class PointOfSale < ApplicationRecord

  belongs_to :tenant
  belongs_to :food_category
  belongs_to :meal_restriction, optional: true
  validates :date, :meal_time, :quantity, presence: true
  acts_as_paranoid

  def self.pointofsale(params)
    pointofsale = []
    #user = User.find(params[:user_id])
    if params[:type] == "tenant"
      tn = Tenant.find(params[:tenant_id])
      fromdate = Date.commercial(Date.today.year, -1+Date.today.cweek, 1)
      todate = Date.today
      id = PointOfSale.where(date: fromdate .. todate).where(tenant_id: tn).ids
      pointofsale = { :tenant => tn.name, :pos_menu => PointOfSale.where(id: id).map{|pp| {:id => pp.id, :date => pp.date, :meal_time => pp.meal_time, :meal_type => pp.meal_type, :meal_category => pp.meal_category, :quantity => pp.quantity, :comment => pp.comment, :actual_qty => pp.actual_qty, :flag => pp.flag, :time => [pp.time.split("|").first.to_date.strftime("%d-%m-%y"),pp.time.split("|").last].join(" "), :updated_at => pp.updated_at.strftime("%a %b %e %Y %I:%M %p") }}}
    else params[:type]  == "admin"
      fromdate = Date.commercial(Date.today.year, -1+Date.today.cweek, 1)
      todate = Date.commercial(Date.today.year, +1+Date.today.cweek, 1)
      id = PointOfSale.where(date: fromdate .. todate).ids
      pointofsale = { :tenant => Tenant.pluck(:id, :name), :pos_menu => PointOfSale.where(id: id).map{|pp| {:id => pp.id, :date => pp.date, :tenant => pp.tenant.name, :meal_time => pp.meal_time, :meal_type => pp.meal_type, :meal_category => pp.meal_category, :quantity => pp.quantity, :comment => pp.comment, :actual_qty => pp.actual_qty, :flag => pp.flag, :time => [pp.time.split(" ").first.to_date.strftime("%d-%m-%y"),pp.time.split("|").last].join("|"), :updated_at => pp.updated_at.strftime("%a %b %e %Y %I:%M %p")}}}
    end
    return pointofsale

  end

    def self.export
    
        columns=[ "date", "tenant", "meal_time", "role_id", "subscription_type", "meal_type", "meal_category", "quantity", "actual_qty", "amount_paid", "comment","flag","time"]
    
        CSV.open("#{Rails.root}/public/files/Dailyorderexport.csv",'w') do |csv|
    
            csv << columns.map{|aa|aa.humanize}
     
            all.each do |product|
     
                mm=product.attributes.values_at(*columns)
       
                mm[1]=product.tenant.name
       
                csv << mm
        
            end
            
        end

    end

end

