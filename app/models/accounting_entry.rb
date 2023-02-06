class AccountingEntry < ApplicationRecord
	STATUSES = %w[pending approved rejected]
	BOOKS = ["General Journal", "Cash Receipts"]

	validates :date_prepared, presence: true
	validates :particular, presence: true
	validates :status, presence: true, inclusion: { in: STATUSES }
	validates :book, presence: true, inclusion: { in: BOOKS }

	has_many :journal_entries
	belongs_to :accounting_code

	def pending?
		self.status == "pending"
	end

	def approved?
		self.status == "approved"
	end

end
