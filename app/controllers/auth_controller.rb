class AuthController < ApplicationController
  def authenticate
    # You'll need to implement the below method. It should return the user instance if the username and password are validates
    # Otherwise return nil
    traveler = Traveler.find_by_credentials(params[:email], params[:password])

    if traveler
      render json: authentication_payload(traveler)
    else
      render json: { errors: ['Invalid username or password'] }, status: :unauthorized
    end
  end

  private
  def authentication_payload(traveler)
    return nil unless traveler && traveler.id
    {
      auth_token: AuthToken.encode({ traveler_id: id }),
      traveler: { id: traveler.id, email: traveler.email } # return whatever traveler info you need
    }
  end
end
