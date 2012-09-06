require 'rest_client'
require 'json'

class Client

  def self.get url, data={}
    response = RestClient.get url, :content_type => :json, :accept => :json
    JSON.parse response
  rescue => e
    e
  end

  def self.post url, data={}
    response = RestClient.post url, data.to_json, :content_type => :json, :accept => :json
    JSON.parse response
  rescue => e
    e
  end

end
