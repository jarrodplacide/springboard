# == Schema Information
# Schema version: 20150929221255
#
# Table name: class_contents
#
#  id         :integer          not null, primary key
#  filename   :string
#  folder_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ClassContent < ActiveRecord::Base
  # Apply Carrierwave Uploader for File
  mount_uploader :filename, ContentUploader

  # Belongs to a Folder
  belongs_to :folder, inverse_of: :class_contents
end
