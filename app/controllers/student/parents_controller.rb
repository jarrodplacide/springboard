class Student::ParentsController < ApplicationController

  def create
    parent = Parent.new(parent_params)
    parent.student_id = current_student.id
    if parent.save
      flash[:success] = "The parent, #{parent.name}, has been successfully added to your account"
    else
      flash[:success] = 'An error occurred. Please try again'
    end
    redirect_to student_show_profile_path
  end

  def update
    parent = Parent.find(params[:id])
    if parent.update_attributes(parent_params)
      flash[:success] = "The information for #{parent.name} has been successfully updated"
      redirect_to student_show_profile_path
    else
      flash[:error] = 'An error occurred. Please try again'
      redirect_to student_show_profile_path
    end
  end

  def destroy
    parent = Parent.find(params[:id])
    if parent.destroy
      flash[:success] = 'The parent record was successfully removed'
    else
      flash[:error] = 'An error occurred. Please try again'
    end
    redirect_to student_show_profile_path
  end

  private
    def parent_params
      params.require(:parent).permit(:first_name, :last_name, :email, :contact_no, :street_address_1, :street_address_2,
                                     :city, :country, :student_id)
    end
end
