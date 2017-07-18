Rails.application.routes.draw do
  # This did not work...
  # Mounting Knock Engine exposes the following endpoint for authentication:
  # http://localhost:3000/knock/auth_token
  # mount Knock::Engine => "/knock"

  post 'traveler_token' => 'traveler_token#create'

  # post 'authenticate' => 'auth#authenticate'

  # resources :trips, only: [:index, :show, :create]

  # resources :travelers
  # resources :trips
  # resources :competitions

  resources :travelers, only: [:index, :show, :create, :update, :destroy] do
    resources :trips, only: [:index, :show, :create]
  end

  resources :trips, only: [:index, :show, :create] do
    resources :competitions
  end


  # resources :competitions, only: [:index, :show, :create]

  # resources :trips, only: [:index, :show, :create]

  # resources :trips do
  #   resources :competitions
  # end

end


# Need to nest routes
# travelers
  # trips

# trips
  # competitions

# OR you might have to do this:

# travelers
  # trips
    # competitions
