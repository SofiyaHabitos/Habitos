class AddBillToCustomerViewControl < ActiveRecord::Migration[5.0]
  def change
    add_column :customer_view_controls, :bill, :string
  end
end
