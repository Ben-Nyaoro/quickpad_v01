# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Clearing database..."

AccountingCode.destroy_all
User.destroy_all

puts "Creating users..."

superuser = User.create(email: "admin@quickpad.com", password: "123456")
regularuser = User.create(email: "user@quickpad.com", password: "123456")

puts "Creating accounting codes..."

puts "Creating accounting codes for assets..."

AccountingCode.create(code: "1000", account: "Cash (main checking account)", description: "Cash from sales kept in the drawer", category: "Cash and cash equivalents
", detail_category: "Cash and cash equivalents", status: "Active")
AccountingCode.create(code: "1001", account: "Cash (payroll account)", description: "Cash to pay salaries and wages", category: "Cash and cash equivalents
", detail_category: "Other current assets", status: "Active")
AccountingCode.create(code: "1002", account: "Accounts Receivable", description: "Money owed by customers", category: "Current assets", detail_category: "Other current assets", status: "Active")
AccountingCode.create(code: "1003", account: "Inventory", description: "Inventory of goods", category: "Current assets", detail_category: "Inventory", status: "Active")

# puts "Creating accounting codes for liabilities..."

# AccountingCode.create(code: "2000", account: "Accounts Payable", description: "Money owed to suppliers", category: "Current liabilities", status: "Active")
# AccountingCode.create(code: "2001", account: "Sales Tax", description: "Sales tax owed", category: "Current liabilities", status: "Active")
# AccountingCode.create(code: "2002", account: "Accrued Expenses", description: "Money owed to service providers", category: "Current liabilities", status: "Active")
# AccountingCode.create(code: "2003", account: "Accrued Liabilities", description: "Money owed to customers", category: "Current liabilities", status: "Active")

# puts "Creating accounting codes for equity..."

# AccountingCode.create(code: "3001", account: "Retained Earnings", description: "Retained earnings", category: "Owner's equity", status: "Active")
# AccountingCode.create(code: "3002", account: "Shareholders Equity", description: "Shareholders equity", category: "Owner's equity", status: "Active")
# AccountingCode.create(code: "3003", account: "Bank Loan", description: "Bank Loan", category: "Owner's equity", status: "Active")

# puts "Creating accounting codes for income..."

# AccountingCode.create(code: "4000", account: "Other Income", description: "Other income", category: "Income", status: "Active")
# AccountingCode.create(code: "4001", account: "Sales Revenue", description: "Sales revenue", category: "Income", status: "Active")
# AccountingCode.create(code: "4002", account: "Rent Revenue", description: "Rent revenue", category: "Income", status: "Active")
# AccountingCode.create(code: "4003", account: "Utilities Revenue", description: "Utilities revenue", category: "Income", status: "Active")
# AccountingCode.create(code: "4004", account: "Other Revenue", description: "Other revenue", category: "Income", status: "Active")

# puts "Creating accounting codes for expenses..."

# AccountingCode.create(code: "5000", account: "Cost of Goods Sold", description: "Cost of goods sold", category: "Expenses", status: "Active")
# AccountingCode.create(code: "5001", account: "Salary Expense", description: "Salary expense", category: "Expenses", status: "Active")
# AccountingCode.create(code: "5002", account: "Rent Expense", description: "Rent expense", category: "Expenses", status: "Active")
# AccountingCode.create(code: "5003", account: "Utilities Expense", description: "Utilities expense", category: "Expenses", status: "Active")
# AccountingCode.create(code: "5004", account: "Other Expense", description: "Other expense", category: "Expenses", status: "Active")

puts "Created all records successfully..."

