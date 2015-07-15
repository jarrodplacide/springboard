class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.date :payment_date
      t.integer :subscription_id
      t.integer :amount_cents
      t.string :status
      t.string :transaction_id
      t.string :type
      t.integer :student_id

      t.timestamps null: false
    end
    add_index :payments, :status
  end
end
