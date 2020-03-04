class AddColToNormalmenuSite < ActiveRecord::Migration[5.0]
  def change
   add_column :normalmenu_sites, :attendance_flag, :boolean, :default => false
  end
end
