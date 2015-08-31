# == Schema Information
# Schema version: 20150715201324
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

class OfflinePayment < Payment
  # Pending Payments
  scope :pending, -> {where(status: 'pending')}
  # Submitted Payments
  scope :submitted, -> {where(status: 'submitted')}
  # Verified Payments
  scope :verified, -> {where(status: 'verified')}

end
