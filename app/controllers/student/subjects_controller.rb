class Student::SubjectsController < ApplicationController
  before_action :authenticate_student!
  before_action :student_subjects, :subjects, except: [:register]
  layout 'student_portal'

  def register
    if not subscription = Subscription.where(student_id: current_student.id, subject_id: params[:id]).first
      subscription = Subscription.new(student_id: current_student.id, subject_id: params[:id])
      if subscription.save
        flash[:success] = "We have initiated the registration process for #{subscription.subject.name}"
        redirect_to payment_student_subject_path(params[:id])
      else
        flash[:success] = 'There was a problem initiating the registration process. Please try again'
        redirect_to new_student_subject_path
      end
    else
      if subscription.start_date.nil?
        flash[:notice] = 'The registration process for this had already been initiated. Please complete payment'
        redirect_to payment_student_subject_path(params[:id])
      else
        if subscription.end_date < Date.today
          flash[:notice] = 'You are already registered for this subject, but your subscription has expired. Please make a payment to renew access'
          # Redirect to Existing Subject Page with Payment screen Option
        else
          flash[:notice] = 'You are already registered for this subject'
        end
        # Redirect to Existing Subject Page
      end
    end
  end

  def payment
    @subject = Subject.find(params[:id])
  end
end
