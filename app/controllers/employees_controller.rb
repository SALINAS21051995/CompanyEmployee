class EmployeesController < ApplicationController
    def show
        @employee = Employee.find(params[:id])
    end
    def destroy
        @result = ActiveRecord::Base.connection.execute("DELETE FROM branches_has_employees where employee_id = #{params[:id]}")
        @result = ActiveRecord::Base.connection.execute("DELETE FROM employees where employee_id = #{params[:id]}")
        #@employee = Employee.find(params[:id])
        #@employee.destroy
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
        @id = session[:company_id]
        @employees = Array.new
        @result = ActiveRecord::Base.connection.execute("Select bhe.employee_id
        from branches_has_employees as bhe 
            inner join branches as b 
            inner join company_has_branch as chb
        ON 
            chb.company_id = #{@id} AND chb.branch_id = b.branch_id AND b.branch_id = bhe.branch_id ;")
        @result.each do |employee|
            @employees.push(Employee.find(employee[0]))
        end
    end
    def edit
        @employee = Employee.find(params[:id])
    end
    def create
        @employee = Employee.new(employee_params)        
        if @employee.save      
            sql = "INSERT INTO branches_has_employees (branch_id, employee_id) VALUES (#{params[:employee][:branch_id]}, #{@employee.id})"
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
