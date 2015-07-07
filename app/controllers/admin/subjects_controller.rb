class Admin::SubjectsController < ApplicationController
  layout "administration"

  def index
    @subjects = Subject.all
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new(subject_params)
    if @subject.save
      flash[:success] = "The subject, #{@subject.name}, was successfully added to the database"
      redirect_to admin_subjects_path
    else
      flash[:success] = 'There was a problem adding the subject to the database. Please try again. If the problem persists, please contact a system administrator'
      redirect_to new_admin_subject_path
    end
  end

  def edit
    @subject = Subject.find(params[:id])
  end

  def update
    @subject = Subject.find(params[:id])
    if @subject.update_attributes(subject_params)
      flash[:success] = "Changes to the subject, #{@subject.name}, were successfully saved"
      redirect_to admin_subjects_path
    else
      flash[:success] = 'There was a problem saving your changes. Please try again. If the problem persists, please contact a system administrator'
      redirect_to edit_admin_subject_path
    end
  end

  def destroy
    @subject = Subject.find(params[:id])
    if @subject.destroy
      flash[:success] = "The subject was successfully removed from the database"
      redirect_to admin_subjects_path
    else
      flash[:success] = 'There was a problem removing the requested subject. Please try again. If the problem persists, please contact a system administrator'
      redirect_to admin_subjects_path
    end
  end

  def show

  end

  private
    def subject_params
      params.require(:subject).permit(:name, :available)
    end
end
