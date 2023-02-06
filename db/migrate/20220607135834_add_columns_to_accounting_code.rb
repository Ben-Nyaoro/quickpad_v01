class AddColumnsToAccountingCode < ActiveRecord::Migration[6.1]
  def change
    add_column :accounting_codes, :detail_category, :string
    add_column :accounting_codes, :balance, :decimal, precision: 5, scale: 2
  end
end
