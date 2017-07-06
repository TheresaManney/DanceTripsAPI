Rails.application.routes.draw do

  resources :trips, only: [:index, :show, :create]

  resources :competitions, only: [:index, :show, :create]

  # test to see if I could get all traveler info
  resources :travelers, only: [:index, :create]

end
