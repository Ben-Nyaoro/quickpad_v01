class AddColumnToAccountingEntry < ActiveRecord::Migration[6.1]
  def change
    add_column :accounting_entries, :ref_number, :integer
  end
end
