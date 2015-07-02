class AddFieldsToInstructor < ActiveRecord::Migration
  def change
    add_column :instructors, :first_name, :string
    add_column :instructors, :last_name, :string
    add_column :instructors, :middle_initial, :string
    add_column :instructors, :contact_no, :string
  end
end
