# == Schema Information
# Schema version: 20150703133312
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
#

class Parent < ActiveRecord::Base
end
