class InstructorMailer < ApplicationMailer
  # E-Mail for Account Created	
  def account_created(instructor, generated_password)
    @instructor = instructor
    @password = generated_password
    mail(to: @instructor.email, subject: 'Your Springboard Academy Access Credentials')
  end

  # E-Mail From Instructor to Student
  def email_student(email)
  	@email = email
  	mail(from: @email.sender, to: @email.recipient, subject: @email.subject)
  end

  # E-Mail from Instructor to Parent or Parents
  def email_parents(email)
  	@email = email
    mail(from: @email.sender, to: @email.recipient, subject: @email.subject)
  end
  
end
