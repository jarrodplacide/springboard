class Instructor::ContentsController < ApplicationController
  layout 'instructor_portal'
  before_action :authenticate_instructor!
  before_action :instructor_subjects

  def new
    @content = ClassContent.new
    @content.folder_id = params[:folder_id]
  end

  def create
    content = ClassContent.new(content_params)
    content.folder_id = params[:folder_id]
    if content.save
      flash[:success] = 'The file has been successfully added to your course section'
    else
      flash[:error] = 'An error occurred attempting to upload the content. Please try again'
    end
    redirect_to instructor_section_folders_path
  end

  def destroy
    content = ClassContent.find(params[:id])
    if content.destroy
      flash[:success] = 'The file was successfully removed'
    else
      flash[:error] = 'An error occurred while attempting to remove the content. Please try again'
    end
  end

  private

  def content_params
    params.require(:class_content).permit(:filename, :name, :folder_id)
  end
end
