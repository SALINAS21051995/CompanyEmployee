class LoginController < ApplicationController
    def index
    end
    def new
    end
    def create 
        #sql = "INSERT INTO branches_has_employees (branch_id, employee_id) VALUES (#{params[:employee][:branch_id]}, #{@employee.id})"
        sql = "SELECT acc.account_id FROM accounts as acc inner join managers as m inner join manager_has_account as mha ON m.manager_email = '#{params[:login][:email]}' AND acc.account_password = '#{params[:login][:password]}' AND mha.manager_id = m.manager_id AND mha.account_id  = acc.account_id ;"
        @result = ActiveRecord::Base.connection.execute(sql) 
        @result.each do |value|
            id = value[0]
        end
        unless id.empty?
            puts id
            redirect_to :controller => 'welcome'
        end 
    end
    def edit
    end
    def update
    end
    def destroy
    end
end
