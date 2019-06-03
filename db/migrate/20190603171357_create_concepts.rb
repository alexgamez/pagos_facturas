class CreateConcepts < ActiveRecord::Migration[5.2]
  def change
    create_table :concepts do |t|
      t.integer :quantity
      t.integer :invoice_id
      t.integer :product_id

      t.timestamps
    end
  end
end
