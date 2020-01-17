class WelcomeController < ApplicationController
  def index    
    @count = Array.new
    @companies = Company.all
    @companies.each do |company|      
      @result = ActiveRecord::Base.connection.execute("select count(company_id) as count from companies_has_employees where company_id = "+company[:company_id].to_s+"")       
      @result.each do |total|
        @count.push(total.count)
      end
    end  
  end
end
