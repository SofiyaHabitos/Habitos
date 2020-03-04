class DeliveryHistory < ApplicationRecord
  belongs_to :tenant
  has_many :deliveries, dependent: :destroy
  belongs_to :menu_customer
  belongs_to :category
  acts_as_paranoid


  def self.delivery_report(params)
    out_data = DeliveryHistory.get_data(params)
    p = Axlsx::Package.new
    p.workbook.add_worksheet(:name => "Delivery time Report") do |sheet|
      sheet.add_row ["Date", "Tenant", "Meal Time", "Driver Name", "Start time", "End time", "Pause Time", "Resume time"]
      out_data.each do |data|
        sheet.add_row [data[0], data[1], data[2], data[3], data[4], data[5], data[6], data[7], data[8]]
      end
    end
    path = "#{Rails.root}/public/export_files/delivery_report.xlsx"
    p.serialize(path)
    return path  	
  end

  def self.get_data(params)
    result = []
    delivery_histories = DeliveryHistory.where(tenant_id: params[:tenant][:id], date: params[:tenant][:from_date]..params[:tenant][:to_date])
	  delivery_histories.map do |delivery|
	    result << [delivery.date.strftime('%d-%m-%Y'), delivery.tenant.name, delivery.category.category_name, delivery.driver_name, delivery.start_time, delivery.stop_time, delivery.pause_time.join(" / "), delivery.resume_time.join(" / ")]
    end
    return result  
  end  

end
