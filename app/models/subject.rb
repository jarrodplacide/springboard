# == Schema Information
# Schema version: 20150703133312
#
# Table name: subjects
#
#  id         :integer          not null, primary key
#  name       :string
#  available  :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Subject < ActiveRecord::Base
  # Scopes
  scope :available, -> {where(available: true)}
  # Can Have Many Sections
  has_many :sections, inverse_of: :subject
  # Can Have Many Subscription associated
  has_many :subscriptions, inverse_of: :subject
end
