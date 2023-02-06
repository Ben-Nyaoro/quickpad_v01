class AccountingEntriesController < ApplicationController

	before_action :set_accounting_entry, only: [ :show, :edit, :update, :destroy ]


  def index
		@accounting_entries = AccountingEntry.all
  end

  def show
		@journal_entry = JournalEntry.new(accounting_entry: @accounting_entry)
		@accounting_entry = AccountingEntry.find(params[:id])
		@journal_entries = JournalEntry.where(accounting_entry_id: @accounting_entry.id)
		@journal_entries = @accounting_entry.journal_entries
		check_and_balance!
  end

	def new
		@accounting_entry = AccountingEntry.new
	end

	def create
		@accounting_entry = AccountingEntry.new(accounting_entry_params)
		if @accounting_entry.save!
			redirect_to @accounting_entry
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @accounting_entry.update(accounting_entry_params)
			redirect_to @accounting_entry
		else
			render 'edit'
		end
	end

	def destroy
		@accounting_entry.destroy
		redirect_to accounting_entries_path
	end

	private

	def accounting_entry_params
		params.require(:accounting_entry).permit(:date_prepared, :date_posted, :particular, :status, :book, :ref_number )
	end

	def set_accounting_entry
		@accounting_entry = AccountingEntry.find(params[:id])
	end

	def check_and_balance!
		@debit_amount  = 0.00
		@credit_amount = 0.00

		@journal_entries.each do |o|
			if o.is_debit?
				@debit_amount  += o.amount
			elsif o.is_credit?
				@credit_amount += o.amount
			end
		end

		if @debit_amount != @credit_amount
			@errors = "Unbalanced journal entries. Debit: #{@debit_amount} Credit: #{@credit_amount}"
		end
	end

end
