class Admin::PaymentsController < ApplicationController
  layout 'administration'

  def offline_payments
    @payments = OfflinePayment.all
  end

  def verify_offline_payment
    @payment = OfflinePayment.includes(subscription: :subject).find(params[:id])
    @payment.status = 'verified'
    if @payment.save
      # TODO Establish Subscription Extension Code
      StudentMailer.verified_payment(current_student, @payment).deliver_now
      flash[:success] = "The payment, with transaction ID: #{@payment.transaction_id}, was successfully verified and an e-mail was sent to the student notifiying them of the course's availability"
    else
      flash[:error] = "There was a problem attempting to mark the selected payment as verified. Please try again. If the problem persists, please contact an administrator"
    end
    redirect_to admin_offline_payments_path
  end

  def offline_payment_information
    @payment = OfflinePayment.find(params[:id])
  end

  def complete_offline_payment
    @payment = OfflinePayment.find(params[:id])
    @payment.status = 'verified'
    if @payment.update_attributes(payment_params)
      StudentMailer.verified_payment(current_student, @payment).deliver_now
      flash[:success] = "The payment, with transaction ID: #{@payment.transaction_id}, was successfully verified and an e-mail was sent to the student notifiying them of the course's availability"
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
