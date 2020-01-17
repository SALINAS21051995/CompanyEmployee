class WelcomeController < ApplicationController
  def index    
    @count = Array.new
    @companies = Company.all
    @branches = Branch.all

    @branches.each do |branch|      
     @result = ActiveRecord::Base.connection.execute("select count(branch_id) as count from branches_has_employees where branch_id = "+branch[:branch_id].to_s+"")       
      @result.each do |total|
        @count.push(total[0])
      end
    end 

  end
end
