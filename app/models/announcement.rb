# == Schema Information
# Schema version: 20150720140427
#
# Table name: announcements
#
#  id         :integer          not null, primary key
#  section_id :integer
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Announcement < ActiveRecord::Base
  # Belongs to a Section
  belongs_to :section, inverse_of: :announcements
end
