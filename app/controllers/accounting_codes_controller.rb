class AccountingCodesController < ApplicationController

	before_action :set_accounting_code, only: [:show, :edit, :update, :destroy]

	def index
		@accounting_codes = AccountingCode.all.select("*").order(:code => :asc)
	end

	def show
	end
	

	def new
		@accounting_code = AccountingCode.new
	end

	def create
		@accounting_code = AccountingCode.new(accounting_code_params)
		if @accounting_code.save
			redirect_to accounting_codes_path
		else
			render :new, notice: "Error creating accounting code"
		end
	end

	def edit
	end

	def update
		if @accounting_code.update(accounting_code_params)
			redirect_to accounting_codes_path
		else
			render :edit, notice: "Error updating accounting code"
		end
	end

	def destroy
    @accounting_code.destroy
    redirect_to accounting_codes_url, notice: "Accounting code was successfully destroyed."
	end

private

	def accounting_code_params
		params.require(:accounting_code).permit(:code, :account, :description, :category, :detail_category, :balance, :status )
	end

	def set_accounting_code
		@accounting_code = AccountingCode.find(params[:id])
	end

end

