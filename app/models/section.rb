# == Schema Information
# Schema version: 20150703133312
#
# Table name: sections
#
#  id            :integer          not null, primary key
#  subject_id    :integer
#  codename      :string
#  start_date    :datetime
#  end_date      :datetime
#  open          :boolean
#  instructor_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Section < ActiveRecord::Base
  scope :newest, -> { order(start_date: :desc) }

  # Belongs to a Subject
  belongs_to :subject, inverse_of: :sections

  # Belongs to an Instructor
  belongs_to :instructor, inverse_of: :sections
end
