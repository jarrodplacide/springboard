# == Schema Information
# Schema version: 20150819134339
#
# Table name: thread_posts
#
#  id            :integer          not null, primary key
#  thread_id     :integer
#  content       :text
#  student_id    :integer
#  instructor_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class ThreadPost < ActiveRecord::Base
  # Belongs to one Discussion Board Topic Thread
  belongs_to :topic_thread, inverse_of: :thread_posts

  # May be created by one Student or Instructor
  belongs_to :student, inverse_of: :thread_posts
  belongs_to :instructor, inverse_of: :thread_posts
end
