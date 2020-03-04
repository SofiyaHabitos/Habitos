
class Vesselplanner < ApplicationRecord
  belongs_to :utensils_category
  belongs_to :utensil
  belongs_to :tenant_detail
  serialize :menuitem , Hash
  belongs_to :tag



  def self.vessel(params)

    params["planner"].each do |i|
      
        a=[]
        a << i[:menuitem]
        a << i[:count]
        b = Hash[*a.flatten]
        i[:menuitem] = b
        

       Vesselplanner.create(menuitem: b , utensil_id: i[:item4] , tenant_detail_id: i[:td_id] , date: i[:date] , countdummy: i[:count] ) 
       Menucycle.find(i["menucycle_id"]).update(status: "Planned")

  #array =[{"item": "Boori","qty": 2,"utensil_id": "48"}]
  #array.map do |i|

   # a=[]
   # a <<  i[:item]
    #a << i[:qty]
    #b= Hash[*a.flatten]
    #i[:item] = b
    #Vesselplanner.create(menuitem: b , utensil_id: i[:utensil_id])
  
     #Vesselplanner.create(params)
    

  end

end



end



=begin  params["planner"].map do |k,v|
    byebug
    a=[]
       a << k["item"]

       a << k["qty"]

      b= Hash[*a.flatten]

      k["item"] = b

@vessel = Vesselplanner.create(params)
       @vessel.save

end
=end


