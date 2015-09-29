class AddSectionIdToFolders < ActiveRecord::Migration
  def change
    add_column :folders, :section_id, :integer
  end
end
