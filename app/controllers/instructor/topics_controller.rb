class Instructor::TopicsController < ApplicationController
  layout 'instructor_portal'
  before_action :authenticate_instructor!
  before_action :instructor_subjects

  def create
    topic = BoardTopic.new(topic_params)
    topic.discussion_board_id = params[:discussion_id]
    if topic.save
      flash[:success] = 'Your topic has been added successfully'
    else
      flash[:error] = 'There was a problem adding your topic. Please try again later'
    end
    redirect_to instructor_section_discussions_path(params[:section_id])
  end

  def edit
    @topic = BoardTopic.find(params[:id])
  end

  def update
    topic = BoardTopic.find(params[:id])
    if topic.update_attributes(topic_params)
      flash[:success] = 'Your topic name has been changed successfully'
    else
      flash[:error] = 'There was a problem editing your topic name. Please try again later'
    end
    redirect_to instructor_section_discussions_path(params[:section_id])
  end

  def destroy
    topic = BoardTopic.find(params[:id])
    if topic.destroy
      flash[:success] = 'The topic has been deleted successfully'
    else
      flash[:error] = 'There was a problem deleting the topic. Please try again later'
    end
    redirect_to instructor_section_discussions_path(params[:section_id])
  end

  private
    def topic_params
      params.require(:board_topic).permit(:name)
    end
end
