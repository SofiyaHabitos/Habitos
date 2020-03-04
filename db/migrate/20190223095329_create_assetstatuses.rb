class CreateAssetstatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :assetstatuses do |t|
      t.references :tag, foreign_key: true
      t.references :utensilname, foreign_key: true
      t.references :kitchen, foreign_key: true
      t.datetime :date
      t.integer :count
      t.string :status

      t.timestamps
    end
  end
end
