class BranchesController < ApplicationController
    def new
        @branch = Branch.new
    end
    def index
        @branches = Array.new        
        @id = session[:company_id]
        @branche_from_company = ActiveRecord::Base.connection.execute("select branch_id from company_has_branch where company_id = #{@id}")       
        @branche_from_company.each do |branch|
            @branches.push(Branch.find(branch[0]))
        end
    end
    def edit
        @branch = Branch.find(params[:id])
    end
    def update
        @branch = Branch.find(params[:id])
 
        if @branch.update(branch_params)
            redirect_to @branch
        else
            render 'edit'
        end
    end
    def show
        @branch = Branch.find(params[:id])
    end
    def destroy
        @result = ActiveRecord::Base.connection.execute("DELETE FROM company_has_branch where branch_id = #{params[:id]}")
        @result = ActiveRecord::Base.connection.execute("DELETE FROM branches where branch_id = #{params[:id]}")

        #@branch = Branch.find(params[:id])
        #@branch.destroy
       
        redirect_to branches_path
    end
    def create
        @branch = Branch.new(branch_params)

        if @branch.save
            sql = "INSERT INTO company_has_branch (company_id, branch_id) VALUES (#{session[:company_id]}, #{@branch.id})"
            ActiveRecord::Base.connection.execute(sql)    
            redirect_to @branch
        else
            render 'new'
        end
    end
    private 
        def branch_params
            params.require(:branch).permit(:branch_name, :branch_street, :branch_col, :branch_int, :branch_ext, :branch_code, :branch_city, :branch_country)
        end
end
