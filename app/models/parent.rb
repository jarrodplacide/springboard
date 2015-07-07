# == Schema Information
# Schema version: 20150707150407
#
# Table name: parents
#
#  id               :integer          not null, primary key
#  first_name       :string
#  last_name        :string
#  email            :string
#  contact_no       :string
#  street_address_1 :string
#  street_address_2 :string
#  city             :string
#  country          :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  student_id       :integer
#

class Parent < ActiveRecord::Base
  # Belongs to one student
  belongs_to :student, inverse_of: :parents

  # Convenience Methods
  def name
    first_name + ' ' + last_name
  end
end
