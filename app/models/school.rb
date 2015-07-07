# == Schema Information
# Schema version: 20150703133312
#
# Table name: schools
#
#  id         :integer          not null, primary key
#  name       :string
#  country    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class School < ActiveRecord::Base
  # Belongs to many Students
  has_many :students, inverse_of: :school

  # Convenience Methods
  def name_with_country
    name + ' - ' + country
  end
end
