class AuditFeedbackCategorySerializer < ActiveModel::Serializer
  attributes :id, :category_name, :category_desc, :status
end
