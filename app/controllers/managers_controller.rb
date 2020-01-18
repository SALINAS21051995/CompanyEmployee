class ManagersController < ApplicationController
    def new 
    end
    def create
        @manager = Manager.new(manager_params)
        @company = Company.new(company_params)
        @account = Account.new(account_params)
        if @manager.save && @company.save && @account.save
            sql = "INSERT INTO company_has_manager (company_id, manager_id) VALUES ( #{@company.id}, #{@manager.id})"
            ActiveRecord::Base.connection.execute(sql) 
            sql = "INSERT INTO manager_has_account (manager_id, account_id) VALUES ( #{@manager.id}, #{@account.id})"
            ActiveRecord::Base.connection.execute(sql)   
            flash.now[:notice] = "Usuario creado Exitosamente"    
            redirect_to :controller => 'login' 
        else
            flash.now[:alert] = "Verifique su información."    
            render 'new'
        end     
    end
    def index
        redirect_to :controller => 'login' 
    end
    private
        def manager_params
            params.require(:account).permit(:manager_name, :manager_surname, :manager_rfc, :manager_email)
        end
    private 
        def company_params
            params.require(:account).permit(:company_name)
        end
    private 
        def account_params
            params.require(:account).permit(:account_password, :account_password_confirmation)
        end
end
