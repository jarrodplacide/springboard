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
          # TODO Redirect to Existing Subject Page with Payment screen Option
        else
          flash[:notice] = 'You are already registered for this subject'
        end
        # TODO Redirect to Existing Subject Page
      end
    end
  end

  def payment
    @subject = Subject.find(params[:id])
  end

  def offline_payment
    @subject = params[:id]
  end

  def initiate_offline_payment
    if subscription = Subscription.where(student_id: current_student.id, subject_id: params[:id]).first
      offline_payment = OfflinePayment.new(student_id: current_student.id, subscription_id: subscription.id, status: 'pending')
      if offline_payment.save
        flash[:success] = 'Your request has been confirmed. A copy of the instructions have been e-mailed.'
        redirect_to new_student_subject_section_path(params[:id])
      else
        flash[:error] = 'An error occurred. Please try again.'
        redirect_to offline_payment_student_subject_path(params[:id])
      end
    else
      flash[:error] = 'Please register for the subject before attempting to make payment'
      # TODO Redirect to Subjects Registration Page
    end
  end

  def offline_payment_info
    if not (@subscription = Subscription.includes(:pending_payments, :subject).find_by(student_id: current_student.id, subject_id: params[:id])).nil?
      if @subscription.pending_payments.first.nil?
        flash[:error] = 'No pending payment was found for this subscription. Please initiate the process via the payment menu on the course page'
        redirect_to student_portal_path
      end
    else
      flash[:error] = 'Your are not registered for this subject. Please register first.'
      redirect_to student_portal_path
    end
  end

  def register_offline_payment
    payment = OfflinePayment.includes(:subscription).find(params[:payment_id])
    payment.status = 'submitted'
    if payment.update_attributes(payment_params)
      flash[:success] = 'Your payment has been registered. The course will become available when a system administrator verifies the payment'
      student_section = StudentSection.find_by(student_id: current_student.id, subject_id: payment.subscription.subject_id)
      redirect_to student_subject_section_path(params[:id], student_section.section_id)
    else
      flash[:error] = 'An error occurred. Please try again'
      redirect_to offline_payment_info_student_subject_path(params[:id])
    end
  end

  def new_e_payment
    @subject = Subject.find(params[:id])
  end

  def e_payment
    if subscription = Subscription.where(student_id: current_student.id, subject_id: params[:id]).first
      payment = EPayment.new({student_id: current_student.id, subscription_id: subscription.id})
      if payment.save
        Twocheckout::API.credentials = {
            :seller_id => '901292025',
            :private_key => '297CC7F7-6A82-41CF-AB83-E768D0646F9D',
            :sandbox => 1
        }
        begin
          result = Twocheckout::Checkout.authorize(e_payment_params(payment.id))
          payment.transaction_id = result["transactionId"]
          payment.amount_cents = params[:tt_total]
          payment.payment_date = DateTime.now
          if payment.save
            if update_subscription(subscription, params[:no_of_months])
              flash[:success] = 'Your payment was successful. A confirmation of this transaction has been e-mailed to you'
              student_section = StudentSection.find_by(student_id: current_student.id, subject_id: payment.subscription.subject_id)
              redirect_to student_subject_section_path(params[:id], student_section.section_id)
            else
              # TODO Write Rollback Error in  Logs for Cross Fix
            end
          else
            # TODO Write Error in Transaction Logs for Cross Fix
          end
        rescue Twocheckout::TwocheckoutError => e
          flash[:error] = e.message
          redirect_to e_payment_new_student_subject_path(params[:id])
        end
      else
        flash[:error] = 'An error occurred'
        redirect_to e_payment_new_student_subject_path(params[:id])
      end
    else
      flash[:error] = 'Please register for the subject before attempting to make payment'
      # TODO Redirect to Subjects Registration Page
    end
  end

  private

  def payment_params
    params.require(:payment).permit(:payment_date, :amount, :transaction_id)
  end

  def e_payment_params(payment_id)
    args = {
      :merchantOrderId => payment_id,
      :token => params[:token],
      :currency => params[:currency],
      :total => params[:total],
      :billingAddr => {
          :name => params[:name],
          :addrLine1 => params[:addrLine1],
          :addrLine2 => (params.has_key?(:addrLine2)) ? params[:addrLine2] : '',
          :city => params[:city],
          :state => (params.has_key?(:state)) ? params[:state] : '',
          :zipCode => (params.has_key?(:zipCode)) ? params[:zipCode] : '',
          :country => params[:billingAddr][:country],
          :email => params[:email],
          :phoneNumber => params[:phoneNumber]
      }
    }
  end
end
