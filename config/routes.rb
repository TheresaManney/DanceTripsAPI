Rails.application.routes.draw do

  post 'traveler_token' => 'traveler_token#create'

  resources :trips, only: [:index, :show, :create]

  resources :competitions, only: [:index, :show, :create]

  # test to see if I could get all traveler info
  resources :travelers, only: [:index, :create]

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
