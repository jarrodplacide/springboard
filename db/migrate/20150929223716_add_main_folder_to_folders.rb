class AddMainFolderToFolders < ActiveRecord::Migration
  def change
    add_column :folders, :main_folder, :boolean
  end
end
