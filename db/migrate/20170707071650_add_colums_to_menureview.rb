class AddColumsToMenureview < ActiveRecord::Migration[5.0]
  def change
  add_reference :menureviews, :foodmenu, foreign_key: true
  end
end
