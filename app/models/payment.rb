# == Schema Information
# Schema version: 20150709225423
#
# Table name: payments
#
#  id              :integer          not null, primary key
#  amount_cents    :integer
#  subscription_id :integer
#  transaction_id  :string
#  student_id      :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Payment < ActiveRecord::Base
  # Belongs to a Subscription
  belongs_to :subscription, inverse_of: :payments

  # Belongs to a Student
  belongs_to :student, inverse_of: :payments

  # Attach Money Gem
  monetize :amount_cents, allow_nil: true
end
