class Instructor::SectionsController < ApplicationController
  layout 'instructor_portal'
  before_action :authenticate_instructor!
  before_action :instructor_subjects

  def index
  end

  def show
    @section = Section.includes(:announcements).find(params[:id])
  end

  def upload
    @section = Section.includes(:subject).find(params[:id])
    @upload = Upload.new
  end

  def send_file
    upload = Upload.new(upload_params)
    upload.section_id = params[:id]
    upload.return_url = instructor_section_url(params[:id])
    wiz = WiziqWebService::Api::Content.new
    response = symbolize(wiz.upload(upload.file.tempfile.path, upload.title, upload.return_url, upload.section_id))
    byebug
    if not response[:rsp].try(:[], :error).nil?
      flash[:error] = 'An error occurred'
    else
      flash[:success] = 'File was uploaded successfully'
    end
    redirect_to instructor_section_path
  end

  private

  def upload_params
    params.require(:upload).permit(:title, :file)
  end
end
