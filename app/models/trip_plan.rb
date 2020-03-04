class TripPlan < ApplicationRecord
  belongs_to :driver
  belongs_to :trip
  belongs_to :category
end
