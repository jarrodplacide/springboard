class Section < ActiveRecord::Base
  scope :newest, -> { order(start_date: :desc) }

  # Belongs to a Subject
  belongs_to :subject, inverse_of: :sections

  # Belongs to an Instructor
  belongs_to :instructor, inverse_of: :sections
end
