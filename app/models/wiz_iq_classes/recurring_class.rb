class RecurringClass
  include ActiveModel::Model

  RETURN_URL = 'http://localhost:3000'

  def initialize(attributes={})
    self.start_time = DateTime.now
    super
    @api = WiziqWebService::Api::WiziqClass.new
  end

  # Attributes
  attr_accessor :name, :start_time, :duration, :instructor_id, :recording_requested, :section_id, :no_of_classes

  # TODO Fix Time Zone problem. Sending Times -4:00 to API
  # Override Start Date Setting
  def set_start_time=(params)
    @start_time = DateTime.new(params['start_time(1i)'].to_i, params['start_time(2i)'].to_i, params['start_time(3i)'].to_i, params['start_time(4i)'].to_i, params['start_time(5i)'].to_i)
  end

  # Save to Api
  def save_weekly
    i = 0
    status = true
    while i < no_of_classes.to_i
      if not save_class
        status = false
        exit
      else
        i += 1
        self.start_time = self.start_time.advance(weeks: 1)
      end
    end
    status
  end

  private
  attr_reader :api

  def save_class
    byebug
    response = WiziqWebService::Api.symbolize(api.create(name, start_time.strftime("%m/%d/%Y %H:%M"), recording_requested == '1' ? true : false, RETURN_URL, duration))
    if not response[:rsp].try(:[], :error).nil?
      false
    else
      wiziqclass = SingleClass.new({name: name, start_time: start_time, duration: duration, recording_requested: recording_requested, section_id: section_id, instructor_id: instructor_id})
      wiziqclass.wiziqdetails(response[:rsp][:create])
      if self.duration == ''
        wiziqclass.duration = api.default_duration
      end
      if wiziqclass.save
        true
      else
        false
      end
    end
  end
end