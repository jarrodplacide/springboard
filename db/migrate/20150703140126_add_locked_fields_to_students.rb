class AddLockedFieldsToStudents < ActiveRecord::Migration
  def change
    add_column :students, :failed_attempts, :integer
    add_column :students, :unlock_token, :string
    add_index :students, :unlock_token
    add_column :students, :locked_at, :datetime
  end
end
