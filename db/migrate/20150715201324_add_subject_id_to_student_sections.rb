class AddSubjectIdToStudentSections < ActiveRecord::Migration
  def change
    add_column :student_sections, :subject_id, :integer
  end
end
