class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    sign_in_url = new_student_session_url
    if request.referer == sign_in_url
      student_portal_path
    else
      stored_location_for(resource) || request.referer || student_portal_path
    end
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def student_subjects
    @student_subjects ||= Array.new
  end

  def subjects
    @subjects ||= Subject.available
  end
end
