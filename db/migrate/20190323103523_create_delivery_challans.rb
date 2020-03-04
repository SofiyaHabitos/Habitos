class CreateDeliveryChallans < ActiveRecord::Migration[5.0]
  def change
    create_table :delivery_challans do |t|
      t.string :dc_no
      t.string :file_path

      t.timestamps
    end
  end
end
