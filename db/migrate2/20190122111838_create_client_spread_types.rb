class CreateClientSpreadTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :client_spread_types do |t|
      t.references :site_category, foreign_key: true
      t.integer :spread_type_id

      t.timestamps
    end
  end
end
