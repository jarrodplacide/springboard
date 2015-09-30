class Student::FoldersController < ApplicationController
  layout 'student_portal'
  before_action :authenticate_student!
  before_action :student_subjects, :subjects

  def index
    @section = Section.includes(:subject, folder: [:class_contents, { subfolders: :class_contents }]).find(params[:section_id])
    @folder = Folder.new
    @file = ClassContent.new
  end
end
