class MenuCustomerDispatch < ApplicationRecord
  belongs_to :menu_customer
  belongs_to :dispatch
  acts_as_paranoid

  def self.create_menu_customer_dispatch(dispatchs, menu_customer_id)
  	menu_customer_dispatch = []
  	dispatchs.each do |dispatch|      
  		menu_customer_dispatch << MenuCustomerDispatch.create(dispatch_id: dispatch.id, menu_customer_id: menu_customer_id)
  	end
  	return menu_customer_dispatch
  end
end
