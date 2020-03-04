class Tag < ApplicationRecord
  belongs_to :utensil
  has_many :vessel_dispatches
  #validates :rfid, presence: true, uniqueness: { case_sensitive: false}
end