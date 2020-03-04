class CreateDcVesseldispatchMappings < ActiveRecord::Migration[5.0]
  def change
    create_table :dc_vesseldispatch_mappings do |t|
      t.references :delivery_challan, foreign_key: true
      t.references :vessel_dispatch, foreign_key: true

      t.timestamps
    end
  end
end
