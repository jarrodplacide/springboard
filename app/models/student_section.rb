# == Schema Information
# Schema version: 20150703133312
#
# Table name: student_sections
#
#  id         :integer          not null, primary key
#  student_id :integer
#  section_id :integer
#  withdrawn  :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class StudentSection < ActiveRecord::Base
  # Belongs to a Student
  belongs_to :student

  # Belongs to a Section
  belongs_to :section
end
