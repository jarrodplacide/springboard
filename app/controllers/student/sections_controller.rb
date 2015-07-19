class Student::SectionsController < ApplicationController
  layout 'student_portal'
  before_action :authenticate_student!
  before_action :student_subjects, :subjects

  def new
    subject = Subject.includes(:open_sections).find(params[:subject_id])
    if subject.open_sections.count == 1
      section = subject.open_sections.first
      student_section = StudentSection.new(student_id: current_student.id, section_id: section.id, subject_id: subject.id)
      if student_section.save
        flash[:notice] = "Welcome to Springboard Academy's #{subject.name} course"
        redirect_to student_subject_section_path(params[:subject_id], section.id)
      else
        # TODO Redirect to Error Page with Option to Try Again. We cannot start the complete process over again.
      end
    else
      # TODO Render View Page with Section Options if there are multiple sections
    end
  end

  def show
    if not (@subscription = Subscription.includes(:pending_payments, :submitted_payments, :completed_payments).find_by(subject_id: params[:subject_id], student_id: current_student.id)).nil?
      @section = Section.includes(:subject, :instructor).find(params[:id])
    else
      @subject = Subject.find(params[:subject_id])
      flash[:error] = "You are not registered for #{@subject.name}. If you are interested, please use the 'My Subjects' menu to register."
      redirect_to student_portal_home
    end
  end
end
