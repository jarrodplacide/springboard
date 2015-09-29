class CreateClassContents < ActiveRecord::Migration
  def change
    create_table :class_contents do |t|
      t.string :filename
      t.integer :folder_id

      t.timestamps null: false
    end
  end
end
