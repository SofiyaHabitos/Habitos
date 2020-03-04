class DcVesseldispatchMapping < ApplicationRecord
  belongs_to :delivery_challan
  belongs_to :vessel_dispatch
end
