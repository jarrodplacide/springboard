class Instructor::ClassesController < ApplicationController
  layout 'instructor_portal'
  before_action :authenticate_instructor!
  before_action :instructor_subjects

  def new
    @wiziqclass = SingleClass.new
    @wiziqclass.section_id = params[:section_id]
  end

  def newrecurring

  end

  def index
    @section = Section.includes(:upcoming_classes, :past_classes).find(params[:section_id])
  end

  def show
    @url = params[:url]
    render :show, layout: 'iframe'
  end

  def create
    wiziqclass = SingleClass.new
    wiziqclass.details(params[:single_class])
    wiz = WiziqWebService::Api::WiziqClass.new
    response = wiz.create(params[:single_class][:title], params[:single_class][:start_time], params[:single_class][:create_recording], instructor_section_path(params[:section_id], params[:single_class][:duration]))
    if response[:rsp][:error].exists?
      flash[:success] = 'A problem occurred with the system. Please contact an administrator'
      redirect_to instructor_section_path(params[:section_id])
    else
      wiziqclass.wiziqdetails(response[:rsp][:create])
      wiziqclass.instructor_id = current_instructor.id
      wiziqclass.section_id = params[:section_id]
      if wiziqclass.save
        flash[:success] = 'Your class was successfully created'
        redirect_to instructor_section_class_path(params[:section_id], wiziqclass)
      else
        flash[:error] = 'An error occurred. Please try again later. If the problem persists, contact an administrator.'
        redirect_to new_instructor_section_class_path(params[:section_id])
      end
    end
  end
end
