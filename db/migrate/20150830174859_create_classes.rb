class CreateClasses < ActiveRecord::Migration
  def change
    create_table :wiz_classes do |t|
      t.integer :wiziq_class_id
      t.string :type
      t.string :status
      t.integer :section_id
      t.datetime :start
      t.datetime :end
      t.string :title
      t.integer :wiziq_master_class_id
      t.integer :duration

      t.timestamps null: false
    end
    add_index :wiz_classes, :status
    add_index :wiz_classes, :wiziq_class_id
  end
end
