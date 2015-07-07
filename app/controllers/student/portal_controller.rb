class Student::PortalController < ApplicationController
  layout 'student_portal'
  before_action :authenticate_student!
  before_action :student_subjects, :subjects

  def home
    if current_student.first_name.nil?
      redirect_to student_new_student_profile_path
    end
  end

  def edit_profile
    @student = Student.find(current_student.id)
  end

  def update_profile
    @student = Student.find(current_student.id)
    if @student.update_attributes(student_params)
      flash[:success] = 'Your profile has successfully been created. Please proceed by adding a parent to your account.'
      redirect_to student_new_parent_for_new_profile_path
    else
      redirect_to student_new_student_profile_path
    end
  end

  def new_parent_for_new_profile
    @parent = Parent.new
  end

  def create_parent_for_new_profile
    parent = Parent.new(parent_params)
    parent.student_id = current_student.id
    if parent.save
      flash[:success] = "You have successfully added #{parent.name} as a parent on your account. Any necessary updates will be sent to the email address provided"
      redirect_to student_portal_path
    else
      flash[:error] = "An error occured. Please try again"
      redirect_to student_new_parent_for_new_profile_path
    end
  end

  private
    def student_subjects
      @student_subjects ||= Array.new
    end

    def subjects
      @subjects ||= Subject.available
    end

    def student_params
      params.require(:student).permit(:first_name, :middle_initial, :last_name, :school_id, :gender, :dob)
    end

    def parent_params
      params.require(:parent).permit(:first_name, :last_name, :email, :contact_no, :street_address_1, :street_address_2,
                                      :city, :country, :student_id)
    end
end
