class Admin::PaymentsController < ApplicationController
  layout 'administration'

  def offline_payments
    @payments = OfflinePayment.all
  end

  # Verify Offline Payment as an Administrator
  def verify_offline_payment
    Payment.transaction do
      @payment = OfflinePayment.includes(subscription: [:subject, :student]).find(params[:id])
      @payment.status = 'verified'
      if @payment.save
        if update_subscription(@payment.subscription, 1)
          student = Student.find(@payment.subscription.student_id)
          StudentMailer.verified_payment(student, @payment).deliver_now
          flash[:success] = "The payment, with transaction ID: #{@payment.transaction_id}, was successfully verified and an e-mail was sent to the student notifiying them of the course's availability"
        else
          raise ActiveRecord::Rollback, 'Subscription Extension Failed Silently!'
        end
      else
        flash[:error] = "There was a problem attempting to mark the selected payment as verified. Please try again. If the problem persists, please contact an administrator"
      end
      redirect_to admin_offline_payments_path
    end
  end

  # Administrator Interface for Entering Student Payment Information
  def offline_payment_information
    @payment = OfflinePayment.find(params[:id])
  end

  def complete_offline_payment
    payment = OfflinePayment.includes(subscription: [:subject, :student]).find(params[:id])
    payment.status = 'verified'
    if payment.update_attributes(payment_params)
      if update_subscription(payment.subscription, (money_without_cents payment.amount)/200)
        student = Student.find(payment.subscription.student_id)
        StudentMailer.verified_payment(student, payment).deliver_now
        flash[:success] = "The payment, with transaction ID: #{payment.transaction_id}, was successfully verified and an e-mail was sent to the student notifiying them of the course's availability"
      else
        raise ActiveRecord::Rollback, 'Subscription Extension Failed Silently!'
      end
    else
      flash[:error] = "There was an error attempting to complete the payment process with the information provided. Please try again. If the problem persists, contact an administrator"
    end
    redirect_to admin_offline_payments_path
  end

  private
  def payment_params
    params.require(:offline_payment).permit(:payment_date, :transaction_id, :amount)
  end
end
