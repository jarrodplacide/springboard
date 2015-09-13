class Admin::ClassesController < ApplicationController
  layout 'administration'

  def index
    # TODO Scope into Past and Upcoming Classes
    @section = Section.includes(:wiz_iq_classes_single_classes).find(params[:section_id])
  end

  def new
    @wiziqclass = SingleClass.new
    @section = Section.includes(:subject).find(params[:section_id])
  end

  def newrecurring

  end

  def create
    wiziqclass = SingleClass.new(class_params)
    section = Section.includes(:instructor).find(params[:section_id])
    wiz = WiziqWebService::Api::WiziqClass.new
    response = symbolize(wiz.create(wiziqclass.name, wiziqclass.start_time, wiziqclass.recording_requested, admin_subject_section_path(params[:subject_id], params[:section_id]), wiziqclass.duration))
    if not response[:rsp].try(:[], :error).nil?
      # TODO Improve Error Handling in Order to Specific Errors. Write Error Handler Method
      flash[:success] = 'A problem occurred with the system. Please contact an administrator'
      # TODO Register Currently Enrolled Students (if any) as Attendees in Wiz IQ System
      redirect_to new_admin_subject_section_class_path(params[:subject_id], params[:section_id])
    else
      wiziqclass.wiziqdetails(response[:rsp][:create])
      wiziqclass.instructor_id = section.instructor_id
      wiziqclass.section_id = params[:section_id]
      if params[:single_class][:duration] == ''
        wiziqclass.duration = wiz.default_duration
      end
      if wiziqclass.save
        flash[:success] = 'Your class was successfully created'
        redirect_to admin_subject_section_class_path(params[:subject_id], params[:section_id], wiziqclass)
      else
        flash[:error] = 'An error occurred. Please try again later. If the problem persists, contact an administrator.'
        redirect_to admin_subject_section_class_path(params[:subject_id], params[:section_id])
      end
    end
  end

  def show
    @wiziqclass = SingleClass.includes(:instructor, :section).find(params[:id])
  end

  def destroy
    wiziqclass = SingleClass.find(params[:id])
    # TODO Implement Catch & Silent Note Error
    wiziqclass_id = wiziqclass.wiziqclass_id
    if wiziqclass.destroy
      flash[:success] = 'The class was successfully canceled'
      wiz = WiziqWebService::Api::WiziqClass.new
      response = wiz.cancel(wiziqclass_id)
      # TODO Error Check
    else
      flash[:error] = 'An error occurred while attempting to delete the class. Please try again later. If hte problem persists, please contact a system administrator.'
    end
    redirect_to admin_subject_section_class_path(params[:subject_id], params[:section_id])
  end

  def edit
    @wiziqclass = SingleClass.find(params[:id])
  end

  def update
    wiziqclass = SingleClass.find(params[:id])
    wiz = WiziqWebService::Api::WiziqClass.new
    response = wiz.modify(wiziqclass.wiziqclass_id, {title: params[:single_class][:name], create_recording: params[:single_class][:recording_requested], start_time: params[:single_class][:start_time], duration: params[:single_class][:duration]})
    # TODO Error Check
  end

  private

  def class_params
    params.require(:single_class).permit(:name, :recording_requested, :start_time, :duration)
  end
end
