class Instructor::DiscussionsController < ApplicationController
  layout 'instructor_portal'
  before_action :authenticate_instructor!
  before_action :instructor_subjects

  def index
    section = Section.includes(:discussion_board).find(params[:section_id])
    if section.discussion_board.count == 1
      @discussion_board = section.discussion_board
    else
      redirect_to new_instructor_section_discussion_path(params[:section_id])
    end
  end

  def new
    @section_id = params[:section_id]
  end

  def create
    board = DiscussionBoard.new(section_id: params[:section_id], available_to_students: false)
    if board.save
      redirect_to instructor_section_discussions_path(params[:section_id])
    else
      flash[:error] = 'There was a problem creating the discussion board for this course. Please try again later'
      redirect_to instructor_portal_path
    end
  end
end
