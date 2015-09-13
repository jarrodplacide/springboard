class Instructor::StudentsController < ApplicationController
  layout 'instructor_portal'
  before_action :authenticate_instructor!
  before_action :instructor_subjects

  def index
  	@section = Section.includes(:subject, :students).find(params[:section_id])
  end

  def show
  	@student = Student.includes(:school).find(params[:id])
    @section = params[:section_id]
  end

  def email
    @student = Student.find(params[:id])
    @section = Section.find(params[:section_id])
    @email = Email.new
  end

  def emailparents
    @student = Student.find(params[:id])
    @section = Section.find(params[:section_id])
    @email = Email.new
  end

  def sendemail
    email = Email.new(email_params)
    student = Student.find(params[:id])
    email.sender = current_instructor.email
    email.recipient = student.email
    InstructorMailer.email_student(email).deliver_now
    flash[:success] = 'Your e-mail was successfully sent.'
    redirect_to instructor_section_students_path(params[:section_id])
  end

  def sendemailtoparents
    email = Email.new(email_params)
    student = Student.includes(:parents).find(params[:id])
    email.sender = current_instructor.email
    email.recipient = student.parents.pluck(:email)
    InstructorMailer.email_parents(email).deliver_now
    flash[:success] = 'Your e-mail was successfully sent to all parents registered on the student account'
    redirect_to instructor_section_students_path(params[:section_id])
  end

  private
    def email_params
      params.require(:email).permit(:subject, :message)
    end
end
