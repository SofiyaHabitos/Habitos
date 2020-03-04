class InventoryLog < ApplicationRecord
  belongs_to :stock_in
  belongs_to :stock_out
  belongs_to :unit_of_measurement
end
