class Student::StaticPagesController < ApplicationController
  layout 'student_auth'

  def verification_required
  end

  def password_reset
  end
end
