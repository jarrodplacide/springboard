class WiziqWebService::Api::Content

  BASE_URL = 'http://content.api.wiziq.com'

  def initialize
  end

  def upload(uploaded_file, content_title, return_url, access_level)
    response WiziqWebService::Api.postrequest(BASE_URL, 'RestService.ashx', 'upload', {file_upload: uploaded_file, title: content_title, return_url: return_url, access_level: access_level})
  end

  def delete(content_id)
    response WiziqWebService::Api.postrequest(BASE_URL, 'RestService.ashx', 'delete', {content_id: content_id})
  end

  private

  def response(body)
    body.parsed_response
  end

end