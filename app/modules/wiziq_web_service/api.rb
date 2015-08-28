require 'hmac-sha1'
require 'base64'
require 'cgi'

class WiziqWebService::Api
  include HTTMultiParty

  format :xml

  API_ACCESS_KEY = 'VtLakPTZ42E='
  API_SECRET_KEY = 'hsoZ0Xi9ZitloqmUl0CzZQ=='

  def self.postrequest(base_uri, endpoint, method, params)
    new(base_uri, endpoint, method, params).httppost
  end

  def httppost
    self.class.post(qualified_endpoint, qualified_options)
  end

  private

  attr_reader :base_uri, :endpoint, :method, :params

  def initialize(base_uri, endpoint, method, params)
    @base_uri = base_uri
    @endpoint = endpoint
    @method = method
    @params = params
  end

  def qualified_endpoint
    "#{base_uri}/#{endpoint}"
  end

  def qualified_options
    key_params = {access_key: API_ACCESS_KEY, timestamp: generate_timestamp, method: method}
    signature = generate_signature(API_SECRET_KEY, key_params)
    params.merge!(key_params)
    params.merge!(signature: signature)
    {query: {method: method}, body: params}
  end

  def generate_timestamp
    time = Time.now
    time.to_i
  end

  def generate_signature(private_key, params)
    signature_base =''
    params.each do |key,value|
      if signature_base.length > 1
        signature_base+='&'
      end
      signature_base+="#{key}=#{value}"
    end
    signature = Base64.encode64(HMAC::SHA1.digest(CGI::escape(private_key), signature_base))
    signature.gsub!(/\n/, '')
  end
end