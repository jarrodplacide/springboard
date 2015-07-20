class AddDeviseFieldsToInstructor < ActiveRecord::Migration
  def change
    add_column :instructors, :locked_at, :datetime
    add_column :instructors, :unlock_token, :string
    add_column :instructors, :failed_attempts, :integer

    add_index :instructors, :unlock_token, unique: true
  end
end
