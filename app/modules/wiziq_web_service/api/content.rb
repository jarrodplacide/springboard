class WiziqWebService::Api::Content

  BASE_URL = 'http://content.api.wiziq.com'
  PRESENTER_EMAIL = 'royaltyclubvp@royalty-club.com'
  ACCESS_LEVEL = 2

  def initialize
  end

  def upload(uploaded_file, content_title, return_url, section)
    response WiziqWebService::Api.postrequest(BASE_URL, 'RestService.ashx', 'upload', {file_upload: uploaded_file, title: content_title})
  end

  def delete(content_id)
    response WiziqWebService::Api.postrequest(BASE_URL, 'RestService.ashx', 'delete', {content_id: content_id})
  end

  private

  def response(body)
    body.parsed_response
  end

  def create_folder(section, date)
    section.to_s + '/' + date.strftime('%Y%d%m')
  end
end