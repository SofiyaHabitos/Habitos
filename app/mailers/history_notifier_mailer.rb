class HistoryNotifierMailer < ApplicationMailer		
	def history
		@menu_masters = MenuMaster.where(:created_at => (Date.today.beginning_of_day..Date.today.end_of_day))
		@menu_customers = MenuCustomer.where(:created_at => (Date.today.beginning_of_day..Date.today.end_of_day))
		#@menu_customers = MenuCustomer.where(:date => (Date.today.beginning_of_day..Date.today.end_of_day))
		#mail(to: "poombavai.sivamani@altiussolution.com",
	         #cc: ["vijayalakshmi.rajendran@adcltech.com"])	    
	    mail to: "pari.muthusamy@altiussolution.com",subject: "Idlidabba usage for #{Date.today.strftime('%a, %d-%b-%Y')}"
	end
end
