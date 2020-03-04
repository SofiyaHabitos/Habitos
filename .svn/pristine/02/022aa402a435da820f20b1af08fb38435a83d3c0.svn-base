class FoodCategory < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false}
  acts_as_paranoid

  has_one :parent_order, dependent: :destroy
  has_many :food_groups, dependent: :destroy  
  has_many :tenant_details, dependent: :destroy
  has_many :production_items, dependent: :destroy
  has_many :point_of_sales, dependent: :destroy
  has_many :menu_masters, dependent: :destroy
  has_many :enrolments, dependent: :destroy
  has_many :old_enrolments, dependent: :destroy

end
