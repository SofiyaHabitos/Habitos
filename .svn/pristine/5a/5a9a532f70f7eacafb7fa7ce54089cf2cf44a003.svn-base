class Answer < ApplicationRecord
  
  belongs_to :question
  
  belongs_to :tenant
  acts_as_paranoid
  
 # belongs_to :imageupload, optional: true

#  belongs_to :image
 
 # accepts_nested_attributes_for :image
 

    def self.order(params)

  	  order=[{:Todayorders=>NormalmenuSite.where(date:Date.today).map{|pp|{:tenant=>pp.tenant,:meal_time=>pp.meal_time,:time=>pp.time,:flag_id=>pp.id,:flag=>pp.flag}}}]
        
        return order
    end

    def self.delivery(params)

    	if params[:category] == "delivery"

    		delivery={:Delivery=>Question.where(category:params[:category]).map{|mm|{:id=>mm.id,:Question=>mm.question,:Answer=>["Yes","No"]}}}

        elsif params[:category] == "service"

        	delivery={:Service=>Question.where(category:params[:category]).map{|mm|{:id=>mm.id,:Question=>mm.question,:Answer=>["Yes","No"]}}}	

        end	

    	return delivery
    	
    end

    #def self.service(params)
    #end

end
