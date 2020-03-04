class TenantNotifierMailer < ApplicationMailer

  def send_cnfrmtn_email(tenant)
     
    @tenant = tenant
     mail( :to => @tenant.email,  
    :subject => 'Confirmation mail from Habitos' )
  end


  def send_assigned_menu(pdf_url, client_email_id)
  	 attachments['assigned_menu.pdf'] =  File.read(pdf_url, :encoding => 'BINARY')
  	 mail( :to => client_email_id, cc: ["manikandan.rajamanickam@adcltech.com","dharmaraj.murugesan@adcltech.com"],:subject => 'Weekly Menu Plan' ) if client_email_id.present?
  end



end


