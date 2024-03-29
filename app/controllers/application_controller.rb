class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include ApplicationHelper

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

  def update_subscription(subscription, months)
    months = months.to_i
    if (student_section = StudentSection.includes(:section).find_by(student_id: subscription.student_id, subject_id: subscription.subject_id)).nil?
      subject = Subject.includes(:open_sections).find(subscription.subject_id)
      if subject.open_sections.count == 1
        section = subject.open_sections.first
        student_section = StudentSection.create(student_id: subscription.student_id, section_id: section.id, subject_id: subject.id)
      else
        return false
      end
    end
    if subscription.start_date.nil?
      subscription.start_date = student_section.section.start_date
      subscription.end_date = student_section.section.start_date.months_since(months)
    elsif subscription.end_date > Date.today
      subscription.end_date = subscription.end_date.months_since(months)
    elsif subscription.end_date < Date.today
      subscription.end_date = Date.today.months_since(months)
    end
    if subscription.save
      true
    else
      false
    end
  end
end
