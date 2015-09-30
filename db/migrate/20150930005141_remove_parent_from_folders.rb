class RemoveParentFromFolders < ActiveRecord::Migration
  def change
    remove_reference :folders, :parent, index: true
  end
end
