class KitchenNotifierMailer < ApplicationMailer

  def send_kitchen_email(kitchen_user)
     
    @kitchen_user = kitchen_user
     mail( :to => @kitchen_user.email,
    :subject => 'User credential details from Idlidabba' )
  end

  def send_cooksheet(cook_sheet_url, email_id)
  	 attachments['cook_sheet.xlsx'] =  File.read(cook_sheet_url, :encoding => 'BINARY')
  	 mail( :to => email_id, :subject => 'Cook Sheet Details' ) if email_id.present?
  end	

 


end
