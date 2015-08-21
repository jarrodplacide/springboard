class Student::ThreadsController < ApplicationController
  layout 'student_portal'
  before_action :authenticate_student!
  before_action :student_subjects, :subjects

  def index
    @topic = BoardTopic.includes(:topic_threads).find(params[:topic_id])
    @new_thread = TopicThread.new
  end

  def show
    @thread = TopicThread.includes(:thread_posts).find(params[:id])
    @new_post = ThreadPost.new
  end

  def create
    thread = TopicThread.new(thread_params)
    thread.board_topic_id = params[:topic_id]
    thread.student_id = current_student.id
    if thread.save
      flash[:success] = 'Your thread has been created successfully'
      redirect_to student_subject_section_discussion_topic_threads_path(params[:subject_id], params[:section_id], params[:discussion_id], params[:topic_id])
    else
      flash[:error] = 'An error occurred while trying to create your thread. Please try again later'
      redirect_to student_subject_section_discussion_topic_threads_path(params[:subject_id], params[:section_id], params[:discussion_id], params[:topic_id])
    end
  end

  def destroy
    thread = TopicThread.find(params[:id])
    if thread.destroy
      flash[:success] = 'The thread and all related posts have been deleted successfully'
      redirect_to student_subject_section_discussion_topic_threads_path(params[:subject_id], params[:section_id], params[:discussion_id], params[:topic_id])
    else
      flash[:error] = 'An error occurred while trying to delete the thread. Please try again later'
      redirect_to student_subject_section_discussion_topic_threads_path(params[:subject_id], params[:section_id], params[:discussion_id], params[:topic_id])
    end
  end

  def edit
    @thread = TopicThread.find(params[:id])
  end

  def update
    thread = TopicThread.find(params[:id])
    if thread.update_attributes(thread_params)
      flash[:success] = 'Your thread title has been edited successfully'
      redirect_to student_subject_section_discussion_topic_threads_path(params[:subject_id], params[:section_id], params[:discussion_id], params[:topic_id])
    else
      flash[:error] = 'An error occurred while trying to edit the title of your thread. Please try again later'
      redirect_to student_subject_section_discussion_topic_threads_path(params[:subject_id], params[:section_id], params[:discussion_id], params[:topic_id])
    end
  end

  private
  def thread_params
    params.require(:topic_thread).permit(:title)
  end
end
