class CreateAccountingCodes < ActiveRecord::Migration[6.1]
  def change
    create_table :accounting_codes, id: :uuid do |t|
      t.string :code
      t.string :account
      t.string :description
      t.string :category
      t.string :status

      t.timestamps
    end
  end
end
