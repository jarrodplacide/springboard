class Section < ActiveRecord::Base
  # Belongs to a Subject
  belongs_to :subject, inverse_of: :sections
end
