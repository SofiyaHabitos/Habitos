module CategoriesHelper

	def default_position(category)
		position_num = category.position.present? ? category.position : Category.last.present? ? Category.pluck(:position).map { |e| e.to_i }.max.to_i + 1 : 1
		return position_num
	end
end
