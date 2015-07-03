class CreateStudentSections < ActiveRecord::Migration
  def change
    create_table :student_sections do |t|
      t.integer :student_id
      t.integer :section_id
      t.boolean :withdrawn, default: false

      t.timestamps null: false
    end
  end
end
