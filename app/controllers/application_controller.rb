class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    if resource.is_a?(Student)
      sign_in_url = new_student_session_url
      if request.referer == sign_in_url
        student_portal_path
      else
        stored_location_for(resource) || request.referer || student_portal_path
      end
    elsif resource.is_a?(Instructor)
      instructor_portal_path
    end
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def student_subjects
    @student_subjects ||= StudentSection.includes(section: :subject).where(student_id: current_student.id)
  end

  def subjects
    @subjects ||= Subject.available
  end

  def instructor_subjects
    @instructor_subjects ||= Section.includes(:subject).where(instructor_id: current_instructor.id)
  end
end
