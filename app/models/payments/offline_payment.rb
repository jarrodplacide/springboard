class OfflinePayment < Payment
  # Pending Payments
  scope :pending, -> {where(status: 'pending')}
  scope :submitted, -> {where(status: 'submitted')}
  scope :verified, -> {where(status: 'verified')}

end