class Auditreview < ApplicationRecord

  belongs_to :tenant
  acts_as_paranoid
  
  def self.review(answers,category,tenant,mealtime,date)

    rat=answers.select{|kk|kk.answer=="Yes" || kk.answer=="NoComplaint"}.count

    if rat <= 1

    	rate = "Poor"

    elsif rat <= 3
    	
    	rate = "Average"

    else rat > 3	
    			
    	rate = "Good"
      
    end
           
  	Auditreview.create(correct:answers.select{|kk|kk.answer=="Yes" || kk.answer=="NoComplaint"}.count , incorrect:answers.select{|kk|kk.answer=="No" || kk.answer=="NoComplaint"}.count, date: date, tenant_id: tenant, mealtime: mealtime, category: category, rating: rate)

  end

  def self.audit(params)

    if Auditreview.last.present?
      audit = []
      mm = Auditreview.last.date
      ll = Auditreview.where(date: mm, tenant_id: params[:tenant_id]).ids
      if ll.present?
        audit = [{:date => Auditreview.last.date, :mealtime => Auditreview.where(id: ll).pluck(:mealtime).uniq[0], :review => Auditreview.where(id: ll).map{|pp|{:category => pp.category, :rating => pp.rating}}}]
      else
        audit = mm
      end
      return audit
    else
      return nil
    end

  end

end