class SoftwareNotifierMailer < ApplicationMailer

def send_software_email(user_id)
    
    usr = User.find(user_id).email
       
       mail( :to => usr,
    :subject => 'Software setup details from Idlidabba',)
  end

end
