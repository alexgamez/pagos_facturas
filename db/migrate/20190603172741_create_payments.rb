class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.date :payment_date
      t.float :penalty
      t.integer :invoice_id

      t.timestamps
    end
  end
end
