class AccessDeniedError < StandardError
end

class NotAuthenticatedError < StandardError
end

class AuthenticationTimeoutError < StandardError
end

class ApplicationController < ActionController::API
  include Knock::Authenticable
  before_action :authenticate_traveler, except: [:create]

  # def set_current_traveler
  #   @current_traveler = current_traveler if current_traveler
  # end
end
