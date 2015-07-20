class Instructor::SectionsController < ApplicationController
  layout 'instructor_portal'
  before_action :authenticate_instructor!
  before_action :instructor_subjects

  def index
  end

  def show
    @section = Section.includes(:announcements).find(params[:id])
  end
end
