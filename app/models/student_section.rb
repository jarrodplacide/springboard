# == Schema Information
# Schema version: 20150715201324
#
# Table name: student_sections
#
#  id         :integer          not null, primary key
#  student_id :integer
#  section_id :integer
#  withdrawn  :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  subject_id :integer
#

class StudentSection < ActiveRecord::Base
  # Belongs to a Student
  belongs_to :student

  # Belongs to a Section
  belongs_to :section

  # Belongs to a Subject
  belongs_to :subject
end
