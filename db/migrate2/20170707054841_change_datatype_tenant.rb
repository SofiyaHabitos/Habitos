class ChangeDatatypeTenant < ActiveRecord::Migration[5.0]
def self.up
    change_table :tenants do |t|
      t.change :sex, :string  
    end
  end
  def self.down
    change_table :tenants do |t|
      t.change :sex, :boolean  
    end
  end
end
