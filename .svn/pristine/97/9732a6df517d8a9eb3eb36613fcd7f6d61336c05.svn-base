class StudentFeedback < ApplicationRecord
  belongs_to :tenant
  acts_as_paranoid
  validates :rating, presence: true

  enum rating: {poor: 1, fair: 2, moderate: 3, good: 4, excellent: 5}

=begin  def self.verify_tenant(params)
  	#tenant = Tenant.find_by_name(params[:tenant_name])
  	tenant = Tenant.find_by('lower(name) = ?', params[:tenant_name].downcase)
  	
  	if tenant.present?
  		tenant = {tenant_id: tenant.id}
  		return tenant
  	else
  		return false
  	end
  end
=end
end
