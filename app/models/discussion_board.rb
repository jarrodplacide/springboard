# == Schema Information
# Schema version: 20150819134339
#
# Table name: discussion_boards
#
#  id                    :integer          not null, primary key
#  section_id            :integer
#  available_to_students :boolean
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

class DiscussionBoard < ActiveRecord::Base
  # Belongs to one section
  belongs_to :section, inverse_of: :discussion_board

  # Has Many Discussion Board Topics
  has_many :board_topics, inverse_of: :discussion_board
end
