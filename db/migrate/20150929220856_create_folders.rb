class CreateFolders < ActiveRecord::Migration
  def change
    create_table :folders do |t|
      t.string :name
      t.references :parent, index: true, foreign_key: true
      t.integer :parent_id

      t.timestamps null: false
    end
  end
end
