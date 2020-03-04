class DispatchUtensilsMapping < ApplicationRecord
  belongs_to :dispatch
  belongs_to :utensil
  belongs_to :tenant
  acts_as_paranoid
end
