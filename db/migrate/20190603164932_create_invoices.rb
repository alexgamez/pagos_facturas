class CreateInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :invoices do |t|
      t.date :creation_date
      t.date :end_date
      t.float :total
      t.integer :user_id

      t.timestamps
    end
  end
end
