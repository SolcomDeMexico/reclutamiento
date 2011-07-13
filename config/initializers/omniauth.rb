require 'forcedotcom'
#
# Set the default hostname for omniauth to send callbacks to.
# seems to be a bug in omniauth that it drops the httpS
# this still exists in 0.2.0
OmniAuth.config.full_host = RECLUTAMIENTO_PATH
#OmniAuth.config.full_host = 'https://rhatter.heroku.com'

module OmniAuth
  module Strategies
    #tell omniauth to load our strategy
    autoload :Forcedotcom, 'lib/forcedotcom'
  end
end


Rails.application.config.middleware.use OmniAuth::Builder do
  provider :forcedotcom, '3MVG9yZ.WNe6byQBDbtmxf76aSYWI9V0VC0sQsZI1JPdbcrcSG3TFcxxYN0UrvqcIzVSYJZjFUy6vEBJCt52o', '5159525136769792583'
  
end