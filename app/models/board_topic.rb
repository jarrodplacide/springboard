# == Schema Information
# Schema version: 20150819134339
#
# Table name: board_topics
#
#  id                  :integer          not null, primary key
#  discussion_board_id :integer
#  name                :string
#  rank                :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class BoardTopic < ActiveRecord::Base
  # Belongs to one Discussion Board
  belongs_to :discussion_board, inverse_of: :board_topics

  # Has Many Topic Threads
  has_many :topic_threads, inverse_of: :board_topic
end
