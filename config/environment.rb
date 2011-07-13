# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Reclutamiento::Application.initialize!
  
#Must be 22 or greater for Chatter REST API
ENV['sfdc_api_version'] = '21.0'
