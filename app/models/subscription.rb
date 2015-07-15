# == Schema Information
# Schema version: 20150709221003
#
# Table name: subscriptions
#
#  id         :integer          not null, primary key
#  start_date :date
#  end_date   :date
#  student_id :integer
#  subject_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Subscription < ActiveRecord::Base
  # May have many payments
  has_many :payments, inverse_of: :subscription

  # Has 0 or many pending payments
  has_many :pending_payments, -> {where status: 'pending'}, class_name: 'OfflinePayment'

  # Belongs to a Student
  belongs_to :student, inverse_of: :subscriptions

  # Belongs to a Subject
  belongs_to :subject, inverse_of: :subscriptions

end
