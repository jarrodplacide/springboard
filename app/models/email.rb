class Email
	include ActiveModel::Model 

	# Attributes
	attr_accessor :subject, :sender, :recipient, :message
end