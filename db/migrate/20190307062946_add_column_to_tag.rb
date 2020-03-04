class AddColumnToTag < ActiveRecord::Migration[5.0]
  def change
    add_column :tags, :status, :string
  end
end
