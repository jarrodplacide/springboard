class Instructor::PortalController < ApplicationController
  layout 'instructor_portal'
  before_action :authenticate_instructor!
  before_action :instructor_subjects

  def home
  end

  def change_password
  	instructor = Instructor.find(current_instructor.id)
  	if password_confirm?(params[:instructor][:password], params[:instructor][:password_confirmation])
  		instructor.password = params[:instructor][:password]
  		instructor.sign_in_count = 2
  		if instructor.save
  			flash[:success] = 'Your password has been successfully changed'
  			redirect_to instructor_portal_path
  		else
  			flash[:error] = 'An error occurred while attempting to change your password. Please try again later'
  			redirect_to instructor_portal_path
  		end
  	else
  		flash[:error] = 'The passwords you entered did not match'
  		redirect_to instructor_portal_path
  	end
  end

end
