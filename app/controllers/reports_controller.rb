class ReportsController < ApplicationController

	def trial_balance
		# Generate an array of all the accounting codes in the system
		accounting_codes = AccountingCode.all

		# Initialize variables to store the total debits and credits for all accounting codes
		total_debits = 0
		total_credits = 0

		# Initialize an empty hash to store the debits and credits for each accounting code
		trial_balance = {}

		# Iterate over each accounting code
		accounting_codes.each do |accounting_code|
			# Get all the accounting entries for this accounting code
			journal_entries = accounting_code.journal_entries

			# Initialize variables to store the total debits and credits for this accounting code
			debits = 0
			credits = 0

			# Iterate over each accounting entry
			journal_entries.each do |journal_entry|
				# Add the entry's debits and credits to the total for this accounting code
				debits += journal_entry.is_debit? ? journal_entry.amount : 0
				credits += journal_entry.is_credit? ? journal_entry.amount : 0
			end

			# Calculate the net difference between debits and credits for this accounting code
			net = debits - credits
			if net > 0
				debits = net
				credits = 0
			elsif net < 0
				credits = -net
				debits = 0
			end

			# Add the total debits and credits for this accounting code to the trial balance hash
			trial_balance[accounting_code.account] = {
				debits: debits,
				credits: credits
			}

			# Add the debits and credits for this accounting code to the total for all accounting codes
			total_debits += debits
			total_credits += credits
		end

		# Pass the trial balance hash and the total debits and credits to the view to display the report
		render :trial_balance, locals: { trial_balance: trial_balance, total_debits: total_debits, total_credits: total_credits }
	end

	def income_statement
    # Get all the accounting codes
    accounting_codes = AccountingCode.all

    # Initialize variables to store the total revenue and expenses for the period
    total_revenue = 0
    total_expenses = 0

    # Initialize a hash to store the total amount for each account type
    account_totals = {
      "Revenue" => 0,
      "Expense" => 0
    }

    # Iterate over each accounting code
    accounting_codes.each do |accounting_code|
      # Get all the accounting entries for this accounting code
      entries = accounting_code.journal_entries

      # Initialize variables to store the total debits and credits for this accounting code
      total_debits = 0
      total_credits = 0

      # Iterate over each accounting entry
      entries.each do |entry|
        # Add the entry's debits and credits to the total for this accounting code
        total_debits += entry.is_debit? ? entry.amount : 0
        total_credits += entry.is_credit? ? entry.amount : 0
      end

      # Check if the accounting code is a revenue or expense account
      if accounting_code.category == "Revenue"
        # Add the total credits for this accounting code to the total revenue
        total_revenue += total_credits
        # Add the total credits for this accounting code to the total for the Revenue account type
        account_totals["Revenue"] += total_credits
      elsif accounting_code.category == "Expense"
        # Add the total debits for this accounting code to the total expenses
        total_expenses += total_debits
        # Add the total debits for this accounting code to the total for the Expense account type
        account_totals["Expense"] += total_debits
      end

			@total_revenue = total_revenue
			@total_expenses = total_expenses
			@account_totals = account_totals
    end
	end



	def balance_sheet
		# Generate an array of all the accounting codes in the system
		accounting_codes = AccountingCode.all

		# Initialize variables to store the total assets, liabilities, and equity
		total_assets = 0
		total_liabilities = 0
		total_equity = 0

		# Iterate over each accounting code
		accounting_codes.each do |accounting_code|
			# Get all the accounting entries for this accounting code
			journal_entries = accounting_code.journal_entries

			# Initialize variables to store the total debits and credits for this accounting code
			total_debits = 0
			total_credits = 0

			# Iterate over each accounting entry
			journal_entries.each do |journal_entry|
				# Add the entry's debits and credits to the total for this accounting code
				total_debits += journal_entry.is_debit? ? journal_entry.amount : 99
				total_credits += journal_entry.is_credit? ? journal_entry.amount : 99
			end

			# Classify the account balance into the appropriate category
			case accounting_code.category
			when 'Asset'
				total_assets += total_credits - total_debits
			when 'Liability'
				total_liabilities += total_debits - total_credits
			when 'Equity'
				total_equity += total_credits - total_debits
			end
		end

		#Return the generated balance sheet
		@balance_sheet = {
			assets: total_assets,
			liabilities: total_liabilities,
			equity: total_equity
		}
	end
end
