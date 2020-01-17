class BranchesController < ApplicationController
    def new
    end
    def index
        @branches = Branch.all
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
        @branch = Branch.find(params[:id])
        @branch.destroy
       
        redirect_to branches_path
    end
    def create
        @branch = Branch.new(branch_params)

        @branch.save
        redirect_to @branch
    end
    private 
        def branch_params
            params.require(:branch).permit(:branch_name, :branch_street, :branch_col, :branch_int, :branch_ext, :branch_code, :branch_city, :branch_country)
        end
end
