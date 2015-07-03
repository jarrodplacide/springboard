class AddConfirmableToStudents < ActiveRecord::Migration
  def change
    add_column :students, :confirmation_token, :string
    add_index :students, :confirmation_token, unique: true
    add_column :students, :confirmed_at, :datetime
    add_column :students, :confirmation_sent_at, :datetime
    add_column :students, :unconfirmed_email, :string
  end
end
