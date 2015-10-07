# == Schema Information
# Schema version: 20151007001911
#
# Table name: payments
#
#  id              :integer          not null, primary key
#  payment_date    :datetime
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

class EPayment < Payment
  # Return Nil for Status
  def status
    nil
  end
end
