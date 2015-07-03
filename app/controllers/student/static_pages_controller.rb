class Student::StaticPagesController < ApplicationController
  layout 'student_auth'

  def verification_required
  end
end
