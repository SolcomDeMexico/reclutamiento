require 'rubygems'
require 'oauth2'
require 'json'
require 'cgi'

# Unfortunately, I haven't yet figured out how to get the instance URL from
# the OAuth response... Give me time :-)
INSTANCE_URL = 'https://na3.salesforce.com';
 
# Monkey patch to correct the Authorization header
class OAuth2::AccessToken
    def request(verb, path, params = {}, headers = {})
      @client.request(verb, path, params, headers.merge('Authorization' => "OAuth #{@token}"))
    end
end
 
# Monkey patch to correct status handling
class OAuth2::Client
    def request(verb, url, params = {}, headers = {})
      if verb == :get || verb == :delete
        resp = connection.run_request(verb, url, nil, headers) do |req|
          req.params.update(params)
        end
      else
        resp = connection.run_request(verb, url, params, headers)
      end
       
      case resp.status
        when 200, 201, 204
          if json?
            return OAuth2::ResponseObject.from(resp)
          else
            return OAuth2::ResponseString.new(resp)
          end
        when 401
          e = OAuth2::AccessDenied.new("Received HTTP 401 during request.")
          e.response = resp
          raise e
        else
          e = OAuth2::HTTPError.new("Received HTTP #{resp.status} during request.")
          e.response = resp
          raise e
      end

    end
end

def client
  OAuth2::Client.new('	
3MVG9Km_cBLhsuPz2R3hJIVrGxOofT2aflzsqXEExhp1hqaOoc2EVVHRrBx5dc6dhg0MZCSEyYRQ7HQk_AVdA',
    '5592815498170171723',
    :site => 'https://login.salesforce.com',
    :authorize_path =>'/services/oauth2/authorize',
    :access_token_path => '/services/oauth2/token'
  )
end
 

