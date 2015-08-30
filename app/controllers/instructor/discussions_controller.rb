class Instructor::DiscussionsController < ApplicationController
  layout 'instructor_portal'
  before_action :authenticate_instructor!
  before_action :instructor_subjects

  def index
    section = Section.includes(:discussion_board).find(params[:section_id])
    if not section.discussion_board.nil?
      @discussion_board = section.discussion_board
      @new_topic = BoardTopic.new
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

  def open
    board = DiscussionBoard.find(params[:id])
    board.available_to_students = true
    if board.save
      flash[:success] = 'The discussion board is now accessible by the courses\'s students'
    else
      flash[:error] = 'An error occurred while trying to open the discussion board. Please try again later'
    end
    redirect_to instructor_section_discussions_path(params[:section_id])
  end

  def close
    board = DiscussionBoard.find(params[:id])
    board.available_to_students = false
    if board.save
      flash[:success] = 'The discussion board is no longer accessible by the course\'s students'
    else
      flash[:error]= 'An error occurred while trying to close the discussion board. Please try again later'
    end
    redirect_to instructor_section_discussions_path(params[:section_id])
  end
end
