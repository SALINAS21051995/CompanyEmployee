class WelcomeController < ApplicationController
  def index  
    unless session[:company_id].nil? && session[:company_name].nil?             
      @id = session[:company_id]
      @company = session[:company_name]
      @count = Array.new
      @companies = Company.all
      @branches = Array.new

      @branche_from_company = ActiveRecord::Base.connection.execute("select branch_id from company_has_branch where company_id = #{@id}")       
      @branche_from_company.each do |branch|  
        @branches.push(Branch.find(branch[0])) 
        @result = ActiveRecord::Base.connection.execute("select count(branch_id) as count from branches_has_employees where branch_id = "+branch[0].to_s+"")       
        @result.each do |total|
          @count.push(total[0])
        end
      end   
    else
      redirect_to :controller => 'login'   
    end
  end 
end
