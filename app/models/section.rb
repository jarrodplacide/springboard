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

  has_many :upcoming_classes, -> { where("start_time > ?", (DateTime.now + 1.hour)).order('start_time ASC') }, class_name: 'SingleClass'

  has_many :past_classes, -> {where("start_time < ?", (DateTime.now - 1.hour)).order('start_time DESC') }, class_name: 'SingleClass'

  # Belongs to a Subject
  belongs_to :subject, inverse_of: :sections

  # Belongs to an Instructor
  belongs_to :instructor, inverse_of: :sections

  # Has Many Classes
  has_many :wiz_iq_classes_single_classes, :class_name => 'SingleClass', inverse_of: :section

  # Has Many Students
  has_many :student_sections
  has_many :students, through: :student_sections

  # Has Many Announcements
  has_many :announcements, -> {order(created_at: :desc)}, inverse_of: :section

  # Has Zero or One Discussion Board
  has_one :discussion_board, inverse_of: :section

  # Has many folders
  has_many :folders, inverse_of: :section

  # Has one top level folder
  has_one :folder, -> {where(main_folder: true)}
end
