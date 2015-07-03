class Student::PortalController < ApplicationController
  layout 'student_portal'
  before_action :authenticate_student!

  def home
  end
end
