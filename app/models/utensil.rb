class Utensil < ApplicationRecord
  belongs_to :kitchen
  #belongs_to :utensils_category
   belongs_to :department
  belongs_to :utensilname
  has_many :tags
  has_many :vessel_dispatches
  accepts_nested_attributes_for :tags, reject_if: proc { |attributes| attributes[:rfid].blank? }
  has_one :dispatch_utensils_mapping, dependent: :destroy
  #validates :price, :tare_weight, :lid_weight, :kitchen_id, presence: true 
  validates :depriciation_category , :asset_type , :count , :tracking ,presence: true
  validates :utensilname_id , presence: true , uniqueness: { case_sensitive: false}
  acts_as_paranoid

  # for automatic generation of tracking id  

  def self.generate_tracking(utensil) 
    unless utensil.tags.present?
        count = utensil.count.present? ? utensil.count : 0
        count.times do |c|
          tag = Tag.create(utensil_id: utensil.id)
          tag.update(auto_id: utensil.department.name[0..2]+"_"+utensil.utensilname.name.delete(' ')[0..2]+"000"+tag.id.to_s)
        end
    else
        count = utensil.count.present? ? utensil.count - utensil.tags.count : 0
        count.times do |c|
          tag = Tag.create(utensil_id: utensil.id)
          tag.update(auto_id: utensil.department.name[0..2]+"_"+utensil.utensilname.name.delete(' ')[0..2]+"000"+tag.id.to_s)
        end
        updatable_count_dummy = utensil.tags.where(status: nil).count if utensil.present? && utensil.tags.present?
        utensil.update!(count_dummy: updatable_count_dummy)
    end
  end

  # def self.category_wise_num_increment(utensil,utensils_category)
  #   if utensil.utensils_category.nil?
  #     catgry = utensil.utensiltype
  #     utnsl_trckng = nil
  #   else
  #     catgry = utensil.utensils_category.utensils_category_name
  #     utnsl_trckng = nil
  #   end
  #   if Utensil.where("tracking LIKE '%#{utensils_category}%'").present?        
  #     utnsl_num = Utensil.where("tracking LIKE '%#{utensils_category}%'").last
  #     utnsl_trckng = (utnsl_num.tracking.split('').last.to_i+1).to_s
  #   else
  #     utnsl_trckng = '1'
  #   end
  #   return utnsl_trckng
  # end
=begin
  def self.utensil_report
    out_data = Utensil.get_data
    p = Axlsx::Package.new
    sheet = p.workbook.add_worksheet(:name => "Utensil Report")
    title = sheet.styles.add_style(:fg_color=>"#FF000000",:b => true,:alignment=>{:horizontal => :center})

    sheet.add_row ["Date", Date.today.strftime("%d-%m-%Y") ], :style=>title
    sheet.add_row ["S.No", "Utensil Category", "Utensil Sub Category", "Total Count", "Available count"], :style => title
    out_data.each do |data|
      sheet.add_row [data[0], data[1], data[2], data[3], data[4]]
    end
    path = "#{Rails.root}/public/export_files/utensil_report.xlsx"
    p.serialize(path)
    return path
  end

  def self.get_data
    result = []
    tt, av = 0, 0
    cnt = 1
   Utensil.all.group_by(&:utensiltype).map do |cate, utensil|
# Utensil.all.map do |cate, utensil|

      category = utensil.first.utensils_category.utensils_category_name
      sub_category = cate
      total_count = utensil.count
      available_count = utensil.select { |e| e.available_status == true }.count
      result << [cnt, category, sub_category, total_count, available_count]
      tt = tt+total_count
      av = av+available_count
      cnt = cnt + 1
    end
    result << [nil]
    result << [nil, "Total", nil, tt, av]
    return result
  end


=end
  
  def self.utensil_report
    out_data = Utensil.get_data
    p = Axlsx::Package.new
    sheet = p.workbook.add_worksheet(:name => "Utensil Report")
    title = sheet.styles.add_style(:fg_color=>"#FF000000",:b => true,:alignment=>{:horizontal => :center})

    sheet.add_row ["Date", Date.today.strftime("%d-%m-%Y") ], :style=>title
    sheet.add_row ["S.No", "Utensil Category", "Total Count", "Available count"], :style => title
    out_data.each do |data|
      sheet.add_row [data[0], data[1], data[2], data[3], data[4]]
    end
    path = "#{Rails.root}/public/export_files/utensil_report.xlsx"
    p.serialize(path)
    return path
  end

  def self.get_data
    result = []
    tt, av = 0, 0
    cnt = 1
    # Utensil.all.group_by(&:utensils_category_id).map do |cate, utensil|
    #   category = utensil.first.utensils_category.utensils_category_name
    #  # sub_category = cate
    #   total_count = utensil.count
    #   available_count = utensil.select { |e| e.available_status == true }.count
    #   #result << [cnt, category, sub_category, total_count, available_count]
    #   result << [cnt, category, total_count, available_count]
    #   tt = tt+total_count
    #   av = av+available_count
    #   cnt = cnt + 1
    # end
    result << [nil]
    result << [nil, "Total", tt, av]
    return result
  end



end
