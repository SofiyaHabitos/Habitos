class ApplicationController < ActionController::Base
  #helper_method :current_user1
  #before_action :current_user
  #protect_from_forgery with: :exception
  protect_from_forgery with: :null_session
  skip_before_filter :verify_authenticity_token
  
  before_action :check_session, :except => ["login","login_validation"]
  #before_action :check_session1, :except => ["create"]

 # $api_service="http://api.idlidabba.com:81"
  $api_service = "http://192.168.1.73:3005"
  #$pim_core_service = "http://35.154.62.156"
  $pim_core_service = "http://18.219.255.116"

  def check_session
    #byebug
    #if session[:kitchen_user_id].blank?
    if "1".blank?
      redirect_to root_path
    end
  end

#   def current_user1  
#       byebug
#     #return unless session[:user_id]  
#    $current_user ||= KitchenUser.find_by(user_name: params["kitchen_user"]["user_name"])
# end
  # def pimcore_url
  #   @pimcore_url = "http://35.154.62.156"
  # end

  

private
  
  def record_not_found
    render errors_path, status: 500
  end

  def record_invalid
    render errors_path, status: 422
  end

end
