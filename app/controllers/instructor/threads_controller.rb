class Instructor::ThreadsController < ApplicationController
  layout 'instructor_portal'
  before_action :authenticate_instructor!
  before_action :instructor_subjects

  def index
    @topic = BoardTopic.includes(:topic_threads).find(params[:topic_id])
    @topic_thread = TopicThread.new
  end

  def show
    @thread = TopicThread.includes(:thread_posts).find(params[:id])
    @thread_post = ThreadPost.new
  end
end
