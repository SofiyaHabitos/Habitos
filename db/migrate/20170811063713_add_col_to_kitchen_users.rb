class AddColToKitchenUsers < ActiveRecord::Migration[5.0]
  def change
      add_column :kitchen_users, :status, :boolean
  end
end
