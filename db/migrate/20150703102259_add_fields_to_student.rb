class AddFieldsToStudent < ActiveRecord::Migration
  def change
    add_column :students, :first_name, :string
    add_column :students, :middle_initial, :string
    add_column :students, :last_name, :string
    add_column :students, :dob, :date
    add_column :students, :gender, :string
    add_column :students, :school_id, :integer
  end
end
