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
      flash[:error] = 'Please register for the subject before attempting to make payment'
      # TODO Redirect to Subjects Registration Page
    end
  end

  def offline_payment_information
    if not (@subscription = Subscription.includes(:pending_payments, :subject).find_by(student_id: current_student.id, subject_id: params[:subject_id])).nil?
      if @subscription.pending_payments.first.nil?
        flash[:error] = 'No pending payment was found for this subscription. Please initiate the process via the payment menu on the course page'
        redirect_to student_portal_path
      end
    else
      flash[:error] = 'Your are not registered for this subject. Please register first.'
      redirect_to student_portal_path
    end
  end

  def register_payment_information
    @payment = OfflinePayment.includes(:subscription).find(params[:id])
    @payment.status = 'submitted'
    if @payment.update_attributes(payment_params)
      flash[:success] = 'Your payment has been registered. The course will become available when a system administrator verifies the payment'
      student_section = StudentSection.find_by(student_id: current_student.id, subject_id: @payment.subscription.subject_id)
      redirect_to student_subject_section_path(params[:subject_id], student_section.section_id)
    else
      flash[:error] = 'An error occurred. Please try again'
      redirect_to student_subject_offline_payment_info_path(params[:subject_id])
    end
  end

  private
    def payment_params
      params.require(:offline_payment).permit(:payment_date, :amount, :transaction_id)
    end
end
