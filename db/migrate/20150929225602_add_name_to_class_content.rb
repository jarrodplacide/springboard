class AddNameToClassContent < ActiveRecord::Migration
  def change
    add_column :class_contents, :name, :string
  end
end
