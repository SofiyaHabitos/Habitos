class OptionalmenuSite < ApplicationRecord
  belongs_to :tenant
  belongs_to :attendance, optional:true
  has_many :optional_menus,  :dependent => :destroy
end
