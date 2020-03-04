class MenuPlanner < ApplicationRecord
  serialize :menu_items, Array
  belongs_to :category
  belongs_to :sub_plan
  belongs_to :tenant_detail


end

