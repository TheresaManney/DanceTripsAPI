Rails.application.routes.draw do
  # This did not work...
  # Mounting Knock Engine exposes the following endpoint for authentication:
  # http://localhost:3000/knock/auth_token
  # mount Knock::Engine => "/knock"

  post 'traveler_token' => 'traveler_token#create'

  post 'authenticate' => 'auth#authenticate'

  # resources :trips, only: [:index, :show, :create]

  resources :travelers
  
  resources :travelers, only: [:index, :create] do
    resources :trips, only: [:index, :show, :create]
  end

  resources :competitions, only: [:index, :show, :create]

  resources :trips, only: [:index, :show, :create]

  # test to see if I could get all traveler info
  # resources :travelers, only: [:index, :create]


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
