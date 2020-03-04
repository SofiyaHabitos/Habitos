require 'csv'
class ProductionItem < ApplicationRecord

  belongs_to :unit_of_measurement
  belongs_to :production_category
  belongs_to :allery, optional: true
  has_one :nutrition, dependent: :destroy
  belongs_to :food_category
  #belongs_to :category
  belongs_to :item_subcategory
  has_many :item_meal_restrictions, dependent: :destroy
  has_many :item_meal_courses, dependent: :destroy
  acts_as_paranoid
  #validates :name,:item_code, presence: true,uniqueness: { case_sensitive: false}
  #validates :quantity, presence: true,numericality: { only_integer: true }
  #validates :cost, :format => { :with => /\A\d+(?:\.\d{0,2})?\z/ }, :numericality => {:greater_than => 0, :less_than => 10000000},presence: true

  	def self.upload(file)

  		  case File.extname(file.original_filename)

  		  when ".csv" 
  
    		  @file = CSV.read(file.tempfile)
  
  		  when ".txt"

    		  @ff=File.open(file.tempfile, "r",:headers=>true)

    		  @ss=@ff.collect{|p| p.encode!('UTF-8', 'binary', invalid: :replace, undef: :replace, replace: '')}

    		  @file=@ss.collect{|a|a.chomp.split(",").collect{|a| a.split("\t")}}

  		  when ".xlsx"

      		@file=File.open(file.tempfile,"r").collect{|p| p.chomp.split("\t")}

  		  end

  		  @head=["Name","Quantity","UOM","Category","Production Category","Allergy List","Production Cost"]

  		  if @file[0].collect{|p| @head.include?(p)}.count(true) == @head.count

  			  @file.shift

  			  @file.each do |line|

     			  if line.count == 7 && UnitOfMeasurement.find_by(name:line[2]).present? &&  Category.where(:category_name=>line[3].split(",")).present?

     				  uom_id=UnitOfMeasurement.find_by(name:line[2]).id

					    cat_id=Category.where(:category_name=>line[3].split(",")).ids

					    pro_id=ProductionCategory.find_by(name:line[4]).id

          	  ProductionItem.create(name:line[0],production_category_id:pro_id,cost:line[6],allergy:line[5].split(","),quantity:line[1],unit_of_measurement_id:uom_id,category:cat_id)

  		  	  end	
         
 	    	end		

  		end

	end

            
  def self.generate_itemcode(production_item)
      
      catgry =production_item.name.upcase.split(' ')
      
      itm_sbctgry_name = production_item.item_subcategory.name.upcase[0]
      #name=catgry[0][0]+catgry[1][0]+itm_sbctgry_name[0][1]


      itm_sbctgry_name = production_item.item_subcategory.name.upcase[0]
      #name=catgry[0][0]+catgry[0][1]+catgry[1][0]
      production_category = nil; itm_num = nil, subcategory_name = nil
      if catgry.count >= 4 
             # production_category = catgry.first(3).map{|i| i.split("").first}.join + catgry.last.split("").first 
             #production_category = catgry[0][0]+catgry[1][0]+catgry[2][0]+itm_sbctgry_name[0][1]
             production_category = catgry[0][0]+catgry[1][0]+catgry[2][0]
      elsif catgry.count == 3
            # production_category = catgry.first(2).map{|i| i.split("").first}.join + catgry.last.split("").first + catgry.last.split("").last
             # production_category = catgry.first(2).map{|i| i.split("").first}.join + catgry.last.split("").first 
              #production_category = catgry[0][0]+catgry[1][0]+itm_sbctgry_name[0][1]
              production_category = catgry[0][0]+catgry[1][0]
      elsif catgry.count == 2
          # production_category= catgry.first.split("").first(2).join + catgry.last.split("").first(2).join
         # production_category = catgry[0][0]+catgry[0][1]+catgry[1][0]
          production_category = catgry[0][0]+catgry[0][1]
      else
          #production_category = catgry[0][0]+catgry[0][1]+itm_sbctgry_name[0][1]
          production_category = catgry[0][0]+catgry[0][1]
      end

      if itm_sbctgry_name.include?("/")
          subcategory_name = itm_sbctgry_name.split("/").first.split("").first + itm_sbctgry_name.split("/").last.split("").first
      else
          if itm_sbctgry_name.split(" ").count >= 2 
              subcategory_name = itm_sbctgry_name.split(" ").first.split("").first + itm_sbctgry_name.split(" ").last.split("").first
          else
              #subcategory_name = itm_sbctgry_name.split(" ").first.split("").first + itm_sbctgry_name.split(" ").last.split("").last
              subcategory_name = itm_sbctgry_name.split(" ").first.split("").first
          end    
      end        
      
      sub_and_prod_ctgry = production_category + subcategory_name
      itm_num = category_wise_num_increment(production_item,sub_and_prod_ctgry)

      production_item.item_code = production_category + subcategory_name + itm_num.to_s.rjust(3, '0')
             
  end

       
  def self.category_wise_num_increment(production_item,production_category)

      catgry = production_item.production_category.name
      itm_itmcde = nil 
      if ProductionItem.where("item_code LIKE '%#{production_category}%'").present?      
          itm_itmcde = ProductionItem.where("item_code LIKE '%#{production_category}%'").pluck(:item_code).map{|a| a.split("").last(3).join.to_i}.max + 1
      else
          itm_itmcde = '1'
      end
      return itm_itmcde
  end



  def self.meal_restriction_update(restriction)

      meal_res = restriction[:item_meal_restrictions][:meal_restriction_id].shift   
       
      restriction_ids = ItemMealRestriction.where(:production_item_id=>@production_item.id).pluck(:meal_restriction_id)

  end


end






































=begin


    def category_wise_num_increment(production_item,production_category)
      catgry = production_item.production_category.name
      itm_itmcde = nil      
      if ProductionItem.where("item_code LIKE '%#{production_category}%'").present?      
          itm_itmcde= ProductionItem.where("item_code LIKE '%#{production_category}%'").pluck(:item_code).map{|a| a.split("").last(3).join.to_i}.max + 1
          #itm_num = ProductionItem.where("item_code LIKE '%#{production_category}%'").last
          #itm_itmcde = (itm_num.item_code.split('').last(3).join.to_i+1).to_s
      else
        itm_itmcde = '1'
      end
      return itm_itmcde
    end


    def generate_itemcode(production_item)
      catgry = production_item.production_category.name.upcase.split(" ")
      itm_sbctgry_name = production_item.item_subcategory.name.upcase
      production_category = nil; itm_num = nil, subcategory_name = nil
      if catgry.count >= 4 
        production_category = catgry.first(3).map{|i| i.split("").first}.join + catgry.last.split("").first 
      elsif catgry.count == 3
        production_category = catgry.first(2).map{|i| i.split("").first}.join + catgry.last.split("").first + catgry.last.split("").last
      elsif catgry.count == 2
        production_category = catgry.first.split("").first(2).join + catgry.last.split("").first(2).join
      else
        production_category = catgry.split("").first(2).join + catgry.split("").last(2).join
      end
      if itm_sbctgry_name.include?("/")
        subcategory_name = itm_sbctgry_name.split("/").first.split("").first + itm_sbctgry_name.split("/").last.split("").first
      else
        if itm_sbctgry_name.split(" ").count >= 2 
          subcategory_name = itm_sbctgry_name.split(" ").first.split("").first + itm_sbctgry_name.split(" ").last.split("").first
        else
          subcategory_name = itm_sbctgry_name.split(" ").first.split("").first + itm_sbctgry_name.split(" ").last.split("").last
        end    
      end  
      sub_and_prod_ctgry = production_category + subcategory_name
      itm_num = category_wise_num_increment(production_item,sub_and_prod_ctgry)
      production_item.item_code = production_category + subcategory_name + itm_num.to_s.rjust(3, '0')
      production_item.update(:item_code=>production_item.item_code)       
    end 


=end

















 #def self.generate_itemcode(production_item)
             #       @num ||= 0        
              #      @num += 1
                    
               #     fn1 = production_item.production_category.name.partition(" ").first.split("").first.upcase
                #    if production_item.production_category.name.partition(" ").last.present?
                 #      fn2 = production_item.production_category.name.partition(" ").last.split("").first.upcase
                  #  else 
                   #    fn2 = production_item.production_category.name.partition(" ").first.split("").last.upcase
                    #end

                    #ln1 = production_item.name.partition(" ").first.split("").first.upcase
                    #if production_item.name.partition(" ").last.present?
                    #   ln2 = production_item.name.partition(" ").last.split("").first.upcase 
                    #else 
                     #  ln2 = production_item.name.partition(" ").first.split("").last.upcase 
                    #end         
                   #production_item.item_code = fn1 + fn2 + ln1 + ln2 + @num.to_s.rjust(3, '0')
              #end


















=begin

  def category_wise_num_increment(production_item,production_category)

      catgry = production_item.production_category.name
      itm_itmcde=nil
  
        if ProductionItem.where("item_code LIKE '%#{production_category}%'").present?      
          itm_num = ProductionItem.where("item_code LIKE '%#{production_category}%'").last
          itm_itmcde = (itm_num.item_code.split('').last(3).join.to_i+1).to_s
        else
          itm_itmcde = '1'
        end
      return itm_itmcde
  end

  def generate_itemcode(production_item)
           
      catgry = production_item.production_category.name
      production_category = nil; itm_num = nil
            
      production_category = catgry.split("").first.upcase + catgry.split("").last.upcase
      itm_name = production_item.name.split("").first.upcase + production_item.name.split("").last.upcase
      itm_num = category_wise_num_increment(production_item,production_category)

      production_item.item_code = production_category + itm_name + itm_num.to_s.rjust(3, '0') #(utnsl_num.utensil_tracking.split('/').last.split('-').last.to_i+1).to_s
        
      production_item.update(:item_code=>production_item.item_code)       
  end


 #splitted_name = production_item.name.split(" ")
 # itm_name = splitted_name.first.split("").first.upcase + splitted_name.last.split("").first.upcase


if itm_sbctgry_split.include?("/")
          itm_sbctgry_split = itm_sbctgry_name.split("/")
      else
          itm_sbctgry_split = itm_sbctgry_name.split(" ")
      end

#subcategory_name = itm_sbctgry_split.first.split("").first.upcase + itm_sbctgry_split.last.split("").first.upcase     


=end