class Student::PaymentsController < ApplicationController
  layout 'student_portal'
  before_action :authenticate_student!
  before_action :student_subjects, :subjects, except: [:offline_payment]

  def offline_payment
    if subscription = Subscription.where(student_id: current_student.id, subject_id: params[:subject_id]).first
      offline_payment = OfflinePayment.new(student_id: current_student.id, subscription_id: subscription.id, status: 'pending')
      if offline_payment.save
        flash[:success] = 'Your request has been confirmed. After submitting your payment, please return to the online portal to submit the payment information.'
        redirect_to new_student_subject_section_path(params[:subject_id])
      else
        flash[:error] = 'An error occurred. Please try again.'
        redirect_to payment_student_subject_path(params[:subject_id])
      end
    else
      flash[:error] = 'Please subscribe to the subject before attempting to make payment'
      # TODO Redirect to Subjects Registration Page
    end
  end
end
