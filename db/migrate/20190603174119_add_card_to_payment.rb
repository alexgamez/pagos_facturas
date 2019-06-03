class AddCardToPayment < ActiveRecord::Migration[5.2]
  def change
    add_column :payments, :card_number, :integer
    add_column :payments, :form_of_pay, :string
  end
end
