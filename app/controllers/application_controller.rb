class AccessDeniedError < StandardError
end

class NotAuthenticatedError < StandardError
end

class AuthenticationTimeoutError < StandardError
end

class ApplicationController < ActionController::API
  include Knock::Authenticable

  before_action :authenticate_traveler
  # undef_method :current_traveler
  # attr_reader: current_traveler
end
