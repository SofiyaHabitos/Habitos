class AuditFeedbackCategory < ApplicationRecord
	enum status: {InActive: 0, Active: 1, suspended: 2, deleted: 3}
end
