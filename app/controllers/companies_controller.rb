class CompaniesController < ApplicationController
    def new
    end
    def index
        @companies = Company.all
    end
    def edit
        @company = Company.find(params[:id])
    end
    def update
        @company = Company.find(params[:id])
 
        if @company.update(company_params)
            redirect_to @company
        else
            render 'edit'
        end
    end
    def show
        @company = Company.find(params[:id])
    end
    def destroy
        @company = Company.find(params[:id])
        @company.destroy
       
        redirect_to companies_path
    end
    def create
        @company =Company.new(company_params)

        @company.save
        redirect_to @company
    end
    private 
        def company_params
            params.require(:company).permit(:company_name, :company_street, :company_col, :company_int, :company_ext, :company_code, :company_city, :company_country)
        end
end