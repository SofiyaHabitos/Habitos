class ClientTypeCategory < ApplicationRecord
  belongs_to :site_category
  belongs_to :client_category
end
