class SiteCategory < ApplicationRecord
 validates :name, presence: true, length: { in: 3..100 },uniqueness: { case_sensitive: false}
 acts_as_paranoid

 has_many :client_categories, :through=> :client_type_categories, dependent: :destroy 
 has_many :client_type_categories
 has_many :client_spread_types, dependent: :destroy 
 accepts_nested_attributes_for :client_type_categories, :reject_if => :all_blank, allow_destroy: true
 accepts_nested_attributes_for :client_spread_types, :reject_if => :all_blank, allow_destroy: true


 def self.client_spread_category(client_category_ids, spread_type_ids, site_category)
 	@site_category = site_category
 	#client_category_ids = client_category_ids.reject! { |s| s.nil? || s.strip.empty? }
 	client_category_ids.each do |category|
      if !category.empty?
        @site_category.client_type_categories.build(:client_category_id => category)
      end
    end

    spread_type_ids.each do |spread|
      if !spread.empty?
        @site_category.client_spread_types.build(:spread_type_id => spread)
      end
    end
 end
end
