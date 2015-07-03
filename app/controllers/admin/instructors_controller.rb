class Admin::InstructorsController < ApplicationController
  layout 'administration'

  def show
    @instructor = Instructor.includes(:sections).find(params[:id])
  end

  def index
    @instructors = Instructor.all
  end

  def new
    @instructor = Instructor.new
  end

  def create
    @instructor = Instructor.new(instructor_params)
    @instructor.password = Devise.friendly_token.first(8)
    if @instructor.save
      flash[:success] = "#{@instructor.name} was successfully added to the list of instructors. An e-mail was sent to them with their access information"
      redirect_to admin_instructors_path
    else
      flash[:error] = "There was a problem attempting to add a new instructor. Please try again. If the error persists, please contact an administrator"
      redirect_to new_admin_instructor_path
    end
  end

  def edit
    @instructor = Instructor.find(params[:id])
  end

  def update
    @instructor = Instructor.find(params[:id])
    if @instructor.update_attributes(instructor_params)
      flash[:success] = "The changes were successfully saved."
      redirect_to admin_instructors_path
    else
      flash[:error] = "There was a problem attempting to save the changes. Please try again. If the problem persists, please contact an administrator"
      redirect_to edit_admin_instructor_path(@instructor)
    end
  end

  def destroy
    @instructor = Instructor.find(params[:id])
    if @instructor.destroy
      flash[:success] = "There account was successfully deleted."
      redirect_to admin_instructors_path
    else
      flash[:error] = 'There was a problem attempting to delete the instructor record. Please try again. If the problem persists, please contact an administrator'
      redirect_to admin_instructors_path
    end
  end

  def sections
    @instructor = Instructor.includes(:sections).find(params[:id])
  end

  private
    def instructor_params
      params.require(:instructor).permit(:first_name, :middle_initial, :last_name, :contact_no, :email)
    end
end
