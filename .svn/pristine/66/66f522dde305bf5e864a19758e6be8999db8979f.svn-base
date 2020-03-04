class NormalMenu < ApplicationRecord
  attr_accessor :meal_type
  #belongs_to :production_item
  #belongs_to :unit_of_measurement
  belongs_to :nutrition
  #belongs_to :mealorder
  belongs_to :food_category
  belongs_to :normalmenu_site
  has_one    :food_return, dependent: :destroy
  has_one    :dispatch_utensils_mapping, dependent: :destroy
  has_one    :dispatch_utensils_mapping
  #validates_uniqueness_of :normalmenu_site_id, scope: [:production_item_id], presence: true
  def self.data_create(normalmenu_params, normalmenu_site_id)
    normalmenu_params["normal_menus_attributes"].map do|kk|  
      normal_menu = new(kk.last)
      normal_menu.normalmenu_site_id = normalmenu_site_id
      normal_menu.save!
    end
  end
end
