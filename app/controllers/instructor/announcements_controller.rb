class Instructor::AnnouncementsController < ApplicationController
  layout 'instructor_portal'
  before_action :authenticate_instructor!
  before_action :instructor_subjects

  def new
    @announcement = Announcement.new
    @announcement.section_id = params[:section_id]
  end

  def create
    announcement = Announcement.new(announcement_params)
    announcement.section_id = params[:section_id]
    if announcement.save
      flash[:success] = 'The announcement was successfully added, and it will now be shown to students.'
      redirect_to instructor_section_path(params[:section_id])
    else
      flash[:error] = 'An error occurred. Please try again.'
      render 'new'
    end
  end

  private

  def announcement_params
    params.require(:announcement).permit(:content)
  end
end
