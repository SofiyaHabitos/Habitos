class Assetstatus < ApplicationRecord
  belongs_to :tag
  belongs_to :utensilname
  belongs_to :kitchen
end
