class Wastage < ApplicationRecord
  belongs_to :tenant
  belongs_to :unit_of_measurement
  has_many :utensils_category
  acts_as_paranoid

  def self.utensil(params)

  	Utensil.where(utensilcategroy:params[:name]).map{|pp|{:id=>pp.utensil_name}}
  	
  end

 def self.utensilname(params)

   Utensil.all.map{|pp|{:name=>pp.utensilcategroy}}
  	
  end
  def self.get_wastage_return(params)
 Wastage.find_by(params).wastage_quantity
  end

end
