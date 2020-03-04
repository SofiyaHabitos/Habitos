class VesselDispatch < ApplicationRecord
  belongs_to :category
  belongs_to :utensil
  belongs_to :tag
  belongs_to :tenant_detail
  has_one :dc_vesseldispatch_mapping

  def self.select(params)
    if DcVesseldispatchMapping.where(vessel_dispatch_id: params["dispatched_ids"]).present?
    dc =  DcVesseldispatchMapping.where(vessel_dispatch_id: params["dispatched_ids"]).last.delivery_challan
    else
      dc =  DeliveryChallan.create(dc_no: "00")
      dc.update(dc_no: dc.dc_no+dc.id.to_s)
      
      params["dispatched_ids"].map{|ves_id| DcVesseldispatchMapping.create(vessel_dispatch_id: ves_id.to_i,delivery_challan_id: dc.id )}
    
    end

    #dc_no.update(dc_no: dc_no.dc_no+dc_no.id.to_s)

    pdf = Prawn::Document.new(:page_layout => :portrait, :page_size =>  [615, 900],  :left_margin => 10,:right_margin => 10,:top_margin => 15, :bottom_margin => 20, :align => :center)
    pdf.font "Helvetica"
    dispatched = VesselDispatch.where(id: params["dispatched_ids"]).order(:tenant_detail_id)
    tenant = dispatched.pluck(:tenant_detail_id).uniq
    #new_qty = MenuCycle.where(date: dispatched.last.date,tenant_detail_id: tenant).pluck(:menu_items).flatten
    #quantity = new_qty.map{|i| i["qty"]}
    tenant_count= MenuCycle.where(date: dispatched.last.date,tenant_detail_id: tenant).pluck(:quantity).map(&:to_i).sum
    tenant_name = dispatched.last.tenant_detail.meal_time
   
   pdf.move_down 150 
     table_head = [["Client Name :","#{dispatched.first.tenant_detail.tenant.name} (GST NO: #{dispatched.first.tenant_detail.tenant.gst_number})"]]
     pdf.table table_head, :column_widths => { 0 => 82.9,1=>511.1},:cell_style => {:size => 10, :padding_bottom => 15,:font_style => :bold, :border_colors => "ffffff"} do
     style(row(0).column(0), :size => 11)
     style(row(0).column(1), :size => 11)
     cells[0, 0].align = :right
     end
     pdf.move_up 13
      table_head = [["Address :","#{dispatched.first.tenant_detail.tenant.address}"]]
     # pdf.table table_head, :column_widths => { 0 => 72.9,1 => 521.1}, :cell_style => {:size => 10, :padding_bottom => 15,:font_style => :bold, :border_colors => "ffffff"} do
     # end
     #
    pdf.table table_head, :column_widths => { 0 => 82.9,1 => 511.1}, :cell_style => {:size => 10, :padding_bottom => 15,:font_style => :bold, :border_colors => "ffffff"} do
      style(row(0).column(0), :size => 11)
      style(row(0).column(1), :size => 11)
      cells[0, 0].align = :right
    end
     pdf.move_up 13 
     table_head = [["Contact :","#{dispatched.first.tenant_detail.tenant.contact_person2}, #{dispatched.first.tenant_detail.tenant.phone2}"]]
     pdf.table table_head, :column_widths => { 0 => 82.9,1 => 511.1},:cell_style => {:size => 10, :padding_bottom => 15,:font_style => :bold, :border_colors => "ffffff"} do
      # style(row(0).column(0), :align => :right)
      style(row(0).column(0), :size => 11)
      style(row(0).column(1), :size => 11)
      cells[0, 0].align = :right
     end

     
     customer_table = [["DC No : #{dc.dc_no}","Date : #{dispatched.first.date.to_date.strftime("%d-%m-%Y")}","Day : #{dispatched.first.date.to_date.strftime("%A")}","Count : #{tenant_count}","Meal : #{tenant_name}"]]
     pdf.table customer_table, :column_widths => { 0 =>119, 1 => 119, 2 => 119, 3 => 119, 4 => 119}, :cell_style => { :size => 9, :height => 30, :padding_bottom => 15, :background_color => "ffffff" } do #background_color: '32a5f5'
          # cells[0, 0].font_style = :bold
          style(row(0).column(0), :size => 11)
          cells[0, 0].borders = [:top, :bottom, :left, :right]

          
          # cells[0, 1].font_style = :bold
          style(row(0).column(1), :size => 11)
          cells[0, 1].borders =  [:top, :bottom, :left, :right]
         
          # cells[0, 1].font_style = :bold
          style(row(0).column(2), :size => 11)
          cells[0, 2].borders =  [:top, :bottom, :left, :right]
         
          # cells[0, 2].font_style = :bold
          style(row(0).column(3), :size => 11)
          cells[0, 3].borders = [:top, :bottom, :left, :right]
          
          # cells[0, 3].font_style = :bold
          style(row(0).column(4), :size => 11)
          cells[0, 4].borders =  [:top, :bottom, :left, :right]
         
          # cells[0, 4].font_style = :bold
        end

         pdf.move_down 20
     
        customer_table = [["S.No","Item Name","Utensils","Count","QTY/Pax","QTY"]]
          pdf.table customer_table, :column_widths => { 0 =>49, 1 => 149, 2 => 99, 3 => 99, 4 => 99, 5 => 98}, :cell_style => { :size => 9, :height => 30, :padding_bottom => 15, :background_color => "ffffff" } do #background_color: '32a5f5'
          style(row(0).column(0), :size => 11)
          cells[0, 0].borders = [:top, :bottom, :left, :right]
          cells[0, 0].align = :center
          cells[0, 0].font_style = :bold
          style(row(0).column(1), :size => 11)
          cells[0, 1].borders =  [:top, :bottom, :left, :right]
          cells[0, 1].align = :center
          cells[0, 1].font_style = :bold
          style(row(0).column(2), :size => 11)
          cells[0, 2].borders =  [:top, :bottom, :left, :right]
          cells[0, 2].align = :center
          cells[0, 2].font_style = :bold
          style(row(0).column(3), :size => 11)
          cells[0, 3].borders = [:top, :bottom, :left, :right]
          cells[0, 3].align = :center
          cells[0, 3].font_style = :bold
          style(row(0).column(4), :size => 11)
          cells[0, 4].borders =  [:top, :bottom, :left, :right]
          cells[0, 4].align = :center
          cells[0, 4].font_style = :bold
          style(row(0).column(5), :size => 11)
          cells[0, 5].borders =  [:top, :bottom, :left, :right]
          cells[0, 5].align = :center
          cells[0, 5].font_style = :bold
        end
        
        all = dispatched.group_by(&:utensil_id)
        data,result = [],[]
        all.map do |k,v| 
          hash ={}
          hash["utensil"] = Utensil.find(k).utensilname.name
          #hash["stud_type"] = ClientCategory.find(v.last.tenant_detail.stud_type.to_i).name
          v.group_by(&:tenant_detail_id).map do |td,menu|
          hash ={}
          hash["utensil"] = Utensil.find(k).utensilname.name
          result=menu.pluck(:menuitem).each_with_object({}) do |hash, acc|
           (acc[hash["name"]] ||= {"name" => hash["name"], "qty" => 0 ,"count"=> 0}).tap  do  |h|
           h["qty"] += hash["qty"].to_f
           h["count"] += 1
           h["uom"] = hash["UOM"]
           h["org_qty"]=hash["qty"].to_f
                 #h["stud_type"] = ClientCategory.find(TenantDetail.find(td).stud_type.to_i).name
           #h["qty_packs"]=hash["qty"].to_f/tenant_count.to_f
           h["qty_packs"] = hash["Portion_size"]
           end
           end
      
         hash["menu"] = result.values
          data << hash
          end
        end
          
        num =1
  
        data.map do |i|
        
        i["menu"].map do |menu|
        
        if menu["qty_packs"].include?(menu["uom"])

          @menu = menu["qty_packs"]
        else
           @menu = menu["qty_packs"] +" "+menu["uom"] 
        end

        customer_table = [["#{num}"")","#{menu["name"]}","#{i["utensil"]}","#{menu["count"]}","#{@menu}","#{menu["qty"].round(3)}"+" "+"#{menu["uom"]}"]]
        # customer_table = [["#{num}"")","#{menu["name"]}","#{i["utensil"]}","#{menu["count"]}","#{menu["qty_packs"]}","#{menu["qty"].round(3)}"+" "+"#{menu["uom"]}"]]
          pdf.table customer_table, :column_widths => { 0 =>49, 1 => 149, 2 => 99, 3 => 99, 4 => 99, 5 => 98}, :cell_style => { :size => 9, :height => 30, :padding_bottom => 15, :background_color => "ffffff"  } do #background_color: '32a5f5'
          style(row(0).column(0), :size => 11)
          cells[0, 0].borders = [:top, :bottom, :left, :right]
          cells[0, 0].align = :center
          cells[0, 0].font_style = :bold
          
          style(row(0).column(1), :size => 11)
          cells[0, 1].borders = [:top, :bottom, :left, :right]
          cells[0, 1].align = :left
          cells[0, 1].font_style = :bold
          
          style(row(0).column(2), :size => 11)
          cells[0, 2].borders = [:top, :bottom, :left, :right]
          cells[0, 2].align = :center
          cells[0, 2].font_style = :bold
          
          style(row(0).column(3), :size => 11)
          cells[0, 3].borders = [:top, :bottom, :left, :right]
          cells[0, 3].align = :center
          cells[0, 3].font_style = :bold
         
          style(row(0).column(4), :size => 11)
          cells[0, 4].borders = [:top, :bottom, :left, :right]
          cells[0, 4].align = :center
          cells[0, 4].font_style = :bold

          style(row(0).column(5), :size => 11)
          cells[0, 5].borders = [:top, :bottom, :left, :right]
          cells[0, 5].align = :center
          cells[0, 5].font_style = :bold
          num += 1
          
        end
     end
 end

      # customer_table = [["For Idli Dabba \n\n\n Packed By: \n\n Signature: \n\n\n Verified By: \n\n Signature: \n\n\n Delivery By: \n\n Vehicle No:","","For Client \n\n\n Received By: \n\n Signature: \n\n\n Vessel Return \n\n Pickup By: \n\n Vehicle No: \n\n Signature:"]]
      # pdf.table customer_table, :column_widths => { 0 => 197, 1 => 197, 2 => 196}, :cell_style => { :size => 10, :padding_top => 15, :border_colors => "ffffff"} do
      #   cells[0, 0].borders = [:bottom, :left, :right]
      #   cells[0, 0].align = :left
      #   cells[0, 1].borders = [:bottom, :left, :right]
      #   cells[0, 1].align = :left
      #   cells[0, 2].borders = [:bottom, :left, :right]
      #   cells[0, 2].align = :left
      # end

  #     pdf.bounding_box([200,450], :width => 200, :height => 250) do
  #         pdf.stroke_bounds   # Show the containing bounding box
  #           pdf.bounding_box([50,200], :width => 50, :height => 50) do
  #             pdf.stroke_bounds
  # end
  
  path = "#{Rails.root}/public/"+dc.dc_no+ "Habitos.pdf"
  unless DcVesseldispatchMapping.where(vessel_dispatch_id: params["dispatched_ids"]).present?
    
   dc.update(file_path: path)
  end 
    pdf.render_file path
  return path

end








end
