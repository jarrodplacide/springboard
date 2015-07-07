class AddStudentIdToParents < ActiveRecord::Migration
  def change
    add_column :parents, :student_id, :integer
  end
end
