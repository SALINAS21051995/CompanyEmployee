class EmployeesController < ApplicationController
    def show
        @employee = Employee.find(params[:id])
    end
    def destroy
        @employee = Employee.find(params[:id])
        @employee.destroy
        redirect_to employees_path
    end   
    def update
        @employee = Employee.find(params[:id])
 
        if @employee.update(employee_params)
            redirect_to @employee
        else
            render 'edit'
        end
    end
    def new 
        @employee = Employee.new        
    end
    def index 
        @employees = Employee.all
    end
    def edit
        @employee = Employee.find(params[:id])
    end
    def create
        @employee = Employee.new(employee_params)        
        if @employee.save      
            sql = "INSERT INTO companies_has_employees (company_id, employee_id) VALUES (#{params[:employee][:company_id]}, #{@employee.id})"
            ActiveRecord::Base.connection.execute(sql)       
            redirect_to @employee
        else
            render 'new'
        end
    end
    private
        def employee_params
            params.require(:employee).permit(:employee_name, :employee_surname, :employee_email, :employee_rfc)
        end

end
