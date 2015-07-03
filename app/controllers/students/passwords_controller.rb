class Students::PasswordsController < Devise::PasswordsController
  layout 'student_auth'
  # GET /resource/password/new
  # def new
  #   super
  # end

  # POST /resource/password
  # def create
  #   super
  # end

  # GET /resource/password/edit?reset_password_token=abcdef
  # def edit
  #   super
  # end

  # PUT /resource/password
  # def update
  #   super
  # end

  protected

  # def after_resetting_password_path_for(resource)
  #   super(resource)
  # end

  # The path used after sending reset password instructions
  # def after_sending_reset_password_instructions_path_for(resource_name)
  #   super(resource_name)
  # end

  def after_resetting_password_path_for(resource)
    student_portal_path
  end

  def after_sending_reset_password_instructions_path_for(resource_name)
    student_password_reset_instructions_sent_path
  end
end
