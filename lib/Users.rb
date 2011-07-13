require 'rubygems'
require 'httparty'

class Users
  include HTTParty
  #doesn't seem to pick up env variable correctly if I set it here
  #headers 'Authorization' => "OAuth #{ENV['sfdc_token']}"
  format :json
  #debug_output $stderr

  def self.set_headers
    headers 'Authorization' => "OAuth #{ENV['sfdc_token']}"
  end

  def self.root_url
    @root_url = ENV['sfdc_instance_url']+"/services/data/v"+ENV['sfdc_api_version']
  end
  
  def self.get_uri(id)
    Users.set_headers
    get(id)
  end
  
  def self.get_available_resources
    Users.set_headers
    get(Users.root_url)
  end
  
  def self.get_objects
    Users.set_headers
    get(Users.root_url+"/sobjects")
  end
  
  def self.get_metadata
    Users.set_headers
    get(Users.root_url+"/sobjects/User")
  end
  
  def self.get_fields
    Users.set_headers
    get(Users.root_url+"/sobjects/User/describe")
  end

  def self.get_first_hundred
    Users.set_headers
    get(Users.root_url+"/query/?q=#{CGI::escape('SELECT Name, Id, Email from User')}")
  end
 
end