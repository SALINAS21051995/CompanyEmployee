class EmployeesController < ApplicationController
    def show
        @employee = Employee.find(params[:id])
    end
    def destroy
        @employee = User.find(params[:id])
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
            redirect_to @employee
        else
            render 'new'
        end
    end
    private
        def employee_params
            params.require(:employee).permit(:employee_name, :employee_surname, :employee_email, :employee_rfc, :company_id, :password, :password_confirmation)
        end
end
