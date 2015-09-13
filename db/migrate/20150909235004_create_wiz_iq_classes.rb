class CreateWizIqClasses < ActiveRecord::Migration
  def change
    create_table :wiz_iq_classes do |t|
      t.integer :wiziqclass_id
      t.integer :instructor_id
      t.string :instructor_url
      t.string :administrator_url
      t.string :name
      t.datetime :start_time
      t.integer :duration
      t.boolean :recording_requested
      t.string :recording_url
      t.integer :section_id

      t.timestamps null: false
    end
    add_index :wiz_iq_classes, :wiziqclass_id, unique: true
    add_index :wiz_iq_classes, :instructor_id
    add_index :wiz_iq_classes, :section_id
  end
end
