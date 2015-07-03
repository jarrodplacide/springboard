class ChangeUnlockTokenOnStudents < ActiveRecord::Migration
  def change
    remove_index :students, :unlock_token
    add_index :students, :unlock_token, unique: true
  end
end
