class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :amount_cents
      t.integer :subscription_id
      t.string :transaction_id
      t.integer :student_id

      t.timestamps null: false
    end
  end
end
