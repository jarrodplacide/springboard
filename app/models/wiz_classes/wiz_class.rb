class WizClass < ActiveRecord::Base
  # Belongs to a Section
  belongs_to :section, inverse_of: :wiz_classes

  # Upcoming Classes
  scope :upcoming, -> {where(status: 'upcoming')}
  # Live Classes
  scope :live, -> {where(status: 'live')}
  # Completed Classes
  scope :completed, -> {where(status: 'completed')}
end