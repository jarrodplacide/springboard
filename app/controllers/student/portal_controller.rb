class Student::PortalController < ApplicationController
  layout 'student_portal'
  before_action :authenticate_student!
  before_action :student_subjects, :subjects

  def home
  end

  private
    def student_subjects
      @student_subjects ||= Array.new
    end

    def subjects
      @subjects ||= Subject.available
    end
end
