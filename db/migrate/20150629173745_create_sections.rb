class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.integer :subject_id
      t.string :codename
      t.datetime :start_date
      t.datetime :end_date
      t.boolean :open
      t.integer :instructor_id

      t.timestamps null: false
    end
  end
end
