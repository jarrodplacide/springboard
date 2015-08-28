class WiziqWebService::Api::Teacher
  BASE_URL = 'http://class.api.wiziq.com'

  TIME_ZONE = 'America/Port_of_Spain'

  def initialize
  end

  def add_teacher(name, email, password, can_schedule_class = 1)
    response WiziqWebService::Api.postrequest(BASE_URL, '', 'add_teacher', {name: name, email: email, password: password, can_schedule_class: can_schedule_class, time_zone: TIME_ZONE})
  end

  private

  def response(body)
    body.parsed_response
  end

end