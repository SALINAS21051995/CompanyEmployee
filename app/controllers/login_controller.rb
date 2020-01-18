class LoginController < ApplicationController
    def index
        unless session[:company_id].nil? && session[:company_name].nil?             
            redirect_to :controller => 'welcome'         
        end
    end
    def new
        session.delete(:company_id)
        session.delete(:company_name)
        redirect_to :controller => 'login'   
    end
    def create 
        #sql = "INSERT INTO branches_has_employees (branch_id, employee_id) VALUES (#{params[:employee][:branch_id]}, #{@employee.id})"
        sql = "SELECT comp.company_name, comp.company_id FROM accounts as acc inner join managers as m inner join manager_has_account as mha inner join company_has_manager as chm inner join companies as comp ON m.manager_email = '#{params[:login][:email]}' AND acc.account_password = '#{params[:login][:password]}' AND mha.manager_id = m.manager_id AND mha.account_id  = acc.account_id AND m.manager_id = chm.manager_id AND chm.company_id = comp.company_id;"
        @result = ActiveRecord::Base.connection.execute(sql) 
        @id
        @name
        @result.each do |value|
            @name = value[0]
            @id = value[1]
        end
        unless @id.nil?
            session[:company_id] = @id
            session[:company_name] = @name
            redirect_to :controller => 'welcome'         
        else
            flash.now[:alert] = "Usuario o contraseña erronea."
            render 'index'
        end 
    end
    def edit
    end
    def update
    end
    def destroy
    end   
end
