class Subject < ActiveRecord::Base
  # Can Have Many Sections
  has_many :sections, inverse_of: :subject
end
