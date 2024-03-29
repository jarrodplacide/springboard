class Admin::SectionsController < ApplicationController
  layout "administration"

  def new
    @subject = Subject.find(params[:subject_id])
    @section = Section.new
  end

  def create
    @subject = Subject.find(params[:subject_id])
    if @subject.sections.create(section_params)
      flash[:success] = "The section, #{params[:section][:codename]}, was successfully added."
      section = Section.last
      Folder.create({section_id: section.id, main_folder: true})
      redirect_to admin_subject_sections_path(@subject)
    else
      flash[:error] = "The section, #{params[:section][:codename]}, could not be added to #{@subject.name}. Please try again. If the problem persists, contact an administrator"
      redirect_to admin_subjects_path
    end
  end

  def edit
    @subject = Subject.find(params[:subject_id])
    @section = Section.find(params[:id])
  end

  def update
    @section = Section.includes(:wiz_iq_classes_single_classes).find(params[:id])
    previous_instructor_id = @section.instructor_id
    if @section.update_attributes(section_params)
      flash[:success] = "The changes to section, #{params[:section][:codename]}, were successfully saved."
      if previous_instructor_id != @section.instructor_id
        @section.wiz_iq_classes_single_classes.each do |c|
          c.instructor_id = @section.instructor_id
          c.save
        end
      end
      redirect_to admin_subject_sections_path(@section.subject)
    else
      flash[:error] = "The changes to section, #{params[:section][:codename]}, could not be saved. Please try again. If the problem persists, contact an administrator"
      redirect_to admin_subjects_path
    end
  end

  def index
    @subject = Subject.includes(sections: :instructor).find(params[:subject_id])
  end

  def destroy
  end

  def open
    @section = Section.find(params[:id])
    @section.open = true
    if @section.save
      flash[:success] = "The section, #{@section.codename}, was successfully opened."
      redirect_to admin_subject_sections_path(@section.subject)
    else
      flash[:error] = "There was an error attempting to open section, #{@section.codename}. Please try again. If the error persists, contact an administrator."
      redirect_to admin_subject_sections_path(@section.subject)
    end
  end

  def close
    @section = Section.find(params[:id])
    @section.open = false
    if @section.save
      flash[:success] = "The section, #{@section.codename}, was successfully closed."
      redirect_to admin_subject_sections_path(@section.subject)
    else
      flash[:error] = "There was an error attempting to close section, #{@section.codename}. Please try again. If the error persists, contact an administrator."
      redirect_to admin_subject_sections_path(@section.subject)
    end
  end

  private
    def section_params
      params.require(:section).permit(:codename, :start_date, :end_date, :instructor_id, :open)
    end
end
