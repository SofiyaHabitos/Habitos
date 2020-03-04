class TenantUpdationMailer < ApplicationMailer

def send_updation_email(tenant)
     
    @tenant = tenant
     mail( :to => @tenant.email,
    :subject => 'Confirmation mail from Idlidabba' )
end

end
