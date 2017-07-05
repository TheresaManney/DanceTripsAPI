Rails.application.routes.draw do

  get "/trips", to: "trips#index", as: "trips"

  get "/trips/:id", to: "trips#show", as: "trip"

  # test to see if I could get all traveler info
  # get "/travelers", to: "travelers#index", as: "travelers"
end
