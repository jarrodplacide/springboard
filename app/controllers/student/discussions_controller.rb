class Student::DiscussionsController < ApplicationController
  layout 'student_portal'
  before_action :authenticate_student!
  before_action :student_subjects, :subjects

  def index
    section = Section.includes(:discussion_board).find(params[:section_id])
    @discussion_board = section.discussion_board
  end
end
