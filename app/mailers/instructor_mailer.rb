class InstructorMailer < ApplicationMailer
  def account_created(instructor, generated_password)
    @instructor = instructor
    @password = generated_password
    mail(to: @instructor.email, subject: 'Your Springboard Academy Access Credentials')
  end
end
