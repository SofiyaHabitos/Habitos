class PageConfiguration < ApplicationRecord
  belongs_to :page
  belongs_to :tenant
end
