class AccessDeniedError < StandardError
end

class NotAuthenticatedError < StandardError
end

class AuthenticationTimeoutError < StandardError
end

class ApplicationController < ActionController::API
  include Knock::Authenticable
  before_action :authenticate_traveler, except: [:create]

end
