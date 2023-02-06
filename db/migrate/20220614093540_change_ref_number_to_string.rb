class ChangeRefNumberToString < ActiveRecord::Migration[6.1]
  def change
		change_column :accounting_entries, :ref_number, :string
  end
end
