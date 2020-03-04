module ApplicationHelper

	def format_date(date)
        unless date.nil? or date == "NA" or date == ""
			date.to_date.strftime("%d-%m-%Y")
		end
	end
	
	def CEO?
		if KitchenUser.find(session[:kitchen_user_id]).role.name =="CEO" 
       true
    end
	end

	def Administrator?
		if KitchenUser.find(session[:kitchen_user_id]).role.name =="Administrator" 
	       true
	    end
	end
    
   	def Nutrition?
		if KitchenUser.find(session[:kitchen_user_id]).role.name =="Nutrition" 
       		true
    	end
	end

	# def Chef?
	# 	if KitchenUser.find(session[:kitchen_user_id]).role.name =="Chef" 
 #       true
 #    end
	# end

	def DispatchManager?
		if KitchenUser.find(session[:kitchen_user_id]).role.name =="Dispatch Manager" 
       true
    end
	end

	def AuditManager?
		if KitchenUser.find(session[:kitchen_user_id]).role.name =="Audit Manager" 
       true
    end
	end

	def Superadmin?
		if KitchenUser.find(session[:kitchen_user_id]).role.name =="superadmin" 
	       true
	    end
	end	
     
    def Admin?
		if KitchenUser.find(session[:kitchen_user_id]).role.name =="Admin" 
	       true
	    end
	end	

	def Chef?
		if KitchenUser.find(session[:kitchen_user_id]).role.name =="Chef" 
	       true
	    end
	end	

	def AccountsExecutive?
       if KitchenUser.find(session[:kitchen_user_id]).role.name =="Accounts executive" 
	       true
	   end
	end

	def Procurement?
       if KitchenUser.find(session[:kitchen_user_id]).role.name =="procurement" 
	       true
	   end
	end

	def create(i)
	
		KitchenUser.find_by(:id=>i.created_by).name unless(i.created_by==nil) && KitchenUser.find_by(:id=>i.created_by) == nil
	
	end

	def update(i)
		
		KitchenUser.find_by(:id=>i.updated_by).name unless(i.updated_by==nil) && KitchenUser.find_by(:id=>i.updated_by) == nil
	end

end
