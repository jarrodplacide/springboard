class WiziqWebService::Api::WiziqClass

  BASE_URL = 'http://class.api.wiziq.com'

  PRESENTER_EMAIL = 'royaltyclubvp@royalty-club.com'
  TIME_ZONE = 'America/New_York'
  STATUS_PING_URL = 'http://localhost:3000/api/class-status'
  DEFAULT_CLASS_DURATION = 60
  ATTENDEE_LIMIT = 100

  def initialize
  end

  # Create A Class
  def create(title, start_time, create_recording, return_url, duration)
    if duration.nil?
      duration = DEFAULT_CLASS_DURATION
    end
    response WiziqWebService::Api.postrequest(BASE_URL, '', 'create', {title: title, start_time: start_time, create_recording: create_recording, duration: duration, return_url: return_url, presenter_email:
                                                      PRESENTER_EMAIL, time_zone: TIME_ZONE, status_ping_url: STATUS_PING_URL})
  end

  # Create a Recurring Class
  # class_occurrence -> Number of Recurring Classes to Schedule. Not Required When class_end_date is given
  # class_repeat_type -> 1: Daily 2: Mon-Sat 3: Mon-Fri 4:Weekly 5:Monthly
  def create_daily(title, start_time, class_occurrence, class_end_date, create_recording, return_url, duration)
    if duration.nil?
      duration = DEFAULT_CLASS_DURATION
    end
    params = {title: title, start_time: start_time, create_recording: create_recording, duration: duration, return_url: return_url, class_repeat_type: 1, presenter_email: PRESENTER_EMAIL,
              time_zone: TIME_ZONE, status_ping_url: STATUS_PING_URL, attendee_limit: ATTENDEE_LIMIT}
    if class_occurrence.nil?
      params.merge!(class_end_date: class_end_date)
    else
      params.merge!(class_occurrence: class_occurrence)
    end
    response WiziqWebService::Api.postrequest(BASE_URL, 'apimanager.ashx', 'create_recurring', params)
  end

  def create_weekly(title, start_time, class_occurrence, class_end_date, specific_week, days_of_week, create_recording, return_url, duration)
    if duration.nil?
      duration = DEFAULT_CLASS_DURATION
    end
    params = {title: title, start_time: start_time, specific_week: specific_week, days_of_week: days_of_week, create_recording: create_recording, duration: duration, return_url: return_url,
              class_repeat_type: 4, presenter_email: PRESENTER_EMAIL, time_zone: TIME_ZONE, status_ping_url: STATUS_PING_URL, attendee_limit: ATTENDEE_LIMIT}
    if class_occurrence.nil?
      params.merge!(class_end_date: class_end_date)
    else
      params.merge!(class_occurrence: class_occurrence)
    end
    response WiziqWebService::Api.postrequest(BASE_URL, 'apimanager.ashx', 'create_recurring', params)
  end

  # Create a Permanent Class
  def create_permanent(title, create_recording, return_url)
    response WiziqWebService::Api.postrequest(BASE_URL, '', 'create_perma_class', {title: title, presenter_email: PRESENTER_EMAIL, status_ping_url: STATUS_PING_URL, create_recording: create_recording,
                                                      return_urk: return_url})
  end

  # Modify an Existing Class
  def modify(class_id, modified_params)
    response WiziqWebService::Api.postrequest(BASE_URL, '', 'modify', modified_params.merge(class_id: class_id))
  end

  def view_schedule(class_master_id)
    response WiziqWebService::Api.postrequest(BASE_URL, '', 'view_schedule', {class_master_id: class_master_id})
  end

  def cancel(class_id)
    response WiziqWebService::Api.postrequest(BASE_URL, '', 'cancel', {class_id: class_id})
  end

  def add_attendees(class_id, attendee_list)
    response WiziqWebService::Api.postrequest(BASE_URL, '', 'add_attendees', {class_id: class_id, attendee_list: attendee_list})
  end

  def download_recording(class_id, recording_format = 'zip')
    response WiziqWebService::Api.postrequest(BASE_URL, '', 'download_recording', {class_id: class_id, recording_format: recording_format})
  end

  # Accessor Methods
  def default_duration
    DEFAULT_CLASS_DURATION
  end

  private

  def response(body)
    body.parsed_response
  end

end