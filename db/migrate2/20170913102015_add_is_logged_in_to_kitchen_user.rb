class AddIsLoggedInToKitchenUser < ActiveRecord::Migration[5.0]
  def change
    add_column :kitchen_users, :is_logged_in, :boolean, default: false
  end
end
