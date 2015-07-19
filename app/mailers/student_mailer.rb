class StudentMailer < ApplicationMailer
  default from: 'notifications@springboard.academy'

  def verified_payment(student, payment)
    @student = student
    @payment = payment
    mail(to: @student.email, subject: 'Your Offline Payment Has Been Verified')
  end
end
