class Instructor::FoldersController < ApplicationController
  layout 'instructor_portal'
  before_action :authenticate_instructor!
  before_action :instructor_subjects

  def index
    @section = Section.includes(:subject, folder: [:class_contents, { subfolders: :class_contents }]).find(params[:section_id])
    @folder = Folder.new
    @file = ClassContent.new
  end

  def show
    @folder = Folder.includes(:subfolders, :class_contents).find(params[:id])
  end

  def create
    folder = Folder.new(folder_params)
    if folder.save
      flash[:success] = 'New Folder Successfully Created'
    else
      flash[:error] = 'An error occurred. Please try again later'
    end
    redirect_to instructor_section_folders_path
  end

  def destroy
    if Folder.find(params[:id]).destroy
      flash[:success] = 'Folder successfully removed'
    else
      flash[:error] = 'An error occurred. Please try again later'
    end
  end

  private

  def folder_params
    params.require(:folder).permit(:name, :section_id, :parent_id)
  end
end
