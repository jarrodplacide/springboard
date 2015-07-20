# == Schema Information
# Schema version: 20150713005314
#
# Table name: payments
#
#  id              :integer          not null, primary key
#  payment_date    :date
#  subscription_id :integer
#  amount_cents    :integer
#  status          :string
#  transaction_id  :string
#  type            :string
#  student_id      :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_payments_on_status  (status)
#

class Payment < ActiveRecord::Base
  # Belongs to a Subscription
  belongs_to :subscription, inverse_of: :payments

  # Belongs to a Student
  belongs_to :student, inverse_of: :payments

  # Apply Money Adapter
  monetize :amount_cents, allow_nil: true
end

# TODO Add Verification Date to record