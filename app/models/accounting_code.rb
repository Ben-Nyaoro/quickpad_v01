class AccountingCode < ApplicationRecord
CATEGORIES  = [
	"Cash and cash equivalents",
	"Current assets",
	"Fixed assets",
	"Non-current assets",
	"Current liabilities",
	"Non-current liabilities",
	"Owner's equity",
	"Income",
	"Cost of sales",
	"Expenses",
	"Other income",
	"Other expense"
		]

DETAIL_CATEGORIES = [
"Accrued holiday payable",
"Accrued liabilities",
"Accrued non-current liabilities",
"Accumulated depreciation on property, plant and equipment",
"Allowance for bad debt",
"Amortisation expense",
"Assets held for sale",
"Available for sale assets (short-term)",
"Bad debts",
"Bank charges",
"Billable Expense Income",
"Cash and cash equivalents",
"Change in inventory - COS",
"Commissions and fees",
"Cost of sales",
"Deferred tax assets",
"Direct labour - COS",
"Discounts given - COS",
"Dividend disbursed",
"Dividend income",
"Dividends payable",
"Dues and subscriptions",
"Equipment rental",
"Equity in earnings of subsidiaries",
"Freight and delivery - COS",
"Goodwill",
"Income tax expense",
"Income tax payable",
"Insurance - Disability",
"Insurance - General",
"Insurance - Liability",
"Intangibles",
"Interest expense",
"Interest income",
"Inventory",
"Inventory Asset",
"Legal and professional fees",
"Liabilities related to assets held for sale",
"Long-term debt",
"Long-Term Investments",
"Loss on discontinued operations, net of tax",
"Loss on disposal of assets",
"Management compensation",
"Materials - COS",
"Meals and entertainment",
"Office expenses",
"Other - COS",
"Other comprehensive income",
"Other general and administrative expenses",
"Other operating income (expenses)",
"Other selling expenses",
"Other Types of Expenses-Advertising Expenses",
"Overhead - COS",
"Payroll Clearing",
"Payroll Expenses",
"Payroll liabilities",
"Prepaid expenses",
"Property, plant and equipment",
"Purchases",
"Reconciliation Discrepancies",
"Rent or lease payments",
"Repairs and Maintenance",
"Retained Earnings",
"Revenue - General",
"Sales",
"Sales - retail",
"Sales - wholesale",
"Sales of Product Income,
Share capital",
"Shipping and delivery expense",
"Short-term debit",
"Stationery and printing",
"Subcontractors - COS,
Supplies",
"Travel expenses - general and admin expenses",
"Travel expenses - selling expenses",
"Uncategorised Asset",
"Uncategorised Expense",
"Uncategorised Income",
"Unrealised loss on securities, net of tax",
"Utilities",
"Wage expenses"

]

STATUS = [
	'Active',
	'Inactive',
	'Closed'
	]

  validates :account, presence: true, uniqueness: true
  validates :code, presence: true, uniqueness: true
  validates :category, presence: true, inclusion: { in: CATEGORIES }
	validates :detail_category, presence: true, inclusion: { in: DETAIL_CATEGORIES }
	validates :status, presence: true, inclusion: { in: STATUS }
  validates :balance, numericality: { greater_than_or_equal_to: 0 }

	has_many :journal_entries, dependent: :destroy
	has_many :accounting_entries , dependent: :destroy

  def to_s
    "#{code} - #{account}"
  end


  has_many :journal_entries, dependent: :destroy

  def balance
    debit_amounts = journal_entries.where(post_type: "DR").sum(:amount)
    credit_amounts = journal_entries.where(post_type: "CR").sum(:amount)

    if debit_amounts > credit_amounts
      debit_amounts - credit_amounts
    else
      credit_amounts - debit_amounts
    end
  end
end
