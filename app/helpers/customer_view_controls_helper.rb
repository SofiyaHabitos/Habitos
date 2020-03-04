module CustomerViewControlsHelper

	def readonly

		unless params[:id].nil?
		 	
		   {:disabled => true,:class=>"form-control boxed single",include_blank: true, :required=>"true"}
		
		else

		    {:disabled => false,:class=>"form-control boxed single",include_blank: true, :required=>"true"}

		end

	end
	
end
