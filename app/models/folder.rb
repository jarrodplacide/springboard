# == Schema Information
# Schema version: 20150929223716
#
# Table name: folders
#
#  id          :integer          not null, primary key
#  name        :string
#  parent_id   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  section_id  :integer
#  main_folder :boolean
#
# Indexes
#
#  index_folders_on_parent_id  (parent_id)
#

class Folder < ActiveRecord::Base
  # May belongs to a Folder
  belongs_to :parent, class_name: "Folder"

  # May have subfolders
  has_many :subfolders, class_name: "Folder", foreign_key: "parent_id"

  # File belongs to a section
  belongs_to :section, inverse_of: :folders

  # Has many content files
  has_many :class_contents, inverse_of: :folder

  # Set Default for Main Folder Boolean
  def set_default_main_folder
    self.main_folder ||= false
  end

  # Set Defaults upon Initialization
  after_initialize :set_default_main_folder, if: :new_record?
end

