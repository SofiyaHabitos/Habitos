class UnitOfMeasurement < ApplicationRecord
  has_one :production_item, dependent: :destroy
  #has_many :utensils_categories
  #has_many :utensils, dependent: :destroy
  #has_many :nutritions, dependent: :destroy
  validates :name, presence: true,uniqueness: { case_sensitive: false}
  acts_as_paranoid
end
