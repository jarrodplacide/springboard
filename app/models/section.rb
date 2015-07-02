class Section < ActiveRecord::Base
  # Belongs to a Subject
  belongs_to :subject, inverse_of: :sections

  # Belongs to an Instructor
  belongs_to :instructor, inverse_of: :sections
end
