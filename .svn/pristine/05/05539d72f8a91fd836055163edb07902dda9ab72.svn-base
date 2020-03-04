class Nutrition < ApplicationRecord
  belongs_to :production_item
  validates :caloire, :protein, :fat, :carbohydrates, :fibre, presence: true, :numericality => true
  acts_as_paranoid
  #validates :production_item_id, presence: true,uniqueness: { case_sensitive: false}
 
end
