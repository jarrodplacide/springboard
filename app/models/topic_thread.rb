# == Schema Information
# Schema version: 20150819135430
#
# Table name: topic_threads
#
#  id             :integer          not null, primary key
#  board_topic_id :integer
#  title          :string
#  student_id     :integer
#  instructor_id  :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class TopicThread < ActiveRecord::Base
  # Belongs to one Discussion Board Topic
  belongs_to :board_topic, inverse_of: :topic_threads

  # Has Many Posts
  has_many :thread_posts, inverse_of: :topic_thread

  # May be created by either an instructor or a student
  belongs_to :student, inverse_of: :topic_threads
  belongs_to :instructor, inverse_of: :topic_threads
end
