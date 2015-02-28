Rails.application.routes.draw do
  get 'login', to: "access#login", as: 'login'

  get 'signup', to: "access#signup", as: 'signup'

  post 'login', to: "access#attempt_login"

  post 'signup', to: "access#create"

  get 'logout', to: "access#logout"

  resources :itineraries do
    post '/comments' => 'comments#create', as: 'comments'
  end
  resources :destinations do
    post '/comments' => 'comments#create', as: 'comments'
  end

  post '/actors/:id/movies/new' => 'actors#add_movie', as: :add_movie
  delete '/actors/:id/movies/:movie_id' => 'actors#remove_movie', as: :remove_movie

  root 'site#index'

  # Adding and removing destination to/from a single itinerary
  post '/itineraries/:id/destinations/new' => 'destinations#create', as: :add_destination
  delete '/itineraries/:id/destinations/:destination_id' => 'destinations#destroy', as: :remove_destination

  # Adding and removing a user/companion to/from an existing destination
  post '/itineraries/:id/destinations/new' => 'companions#create', as: :add_companion
  post '/itineraries/:id/destinations/:destination_id/edit' => 'companions#create', as: :add_companion
  delete '/itineraries/:id/destinations/:destination_id' => 'companions#destroy', as: :remove_companion
  delete '/itineraries/:id/destinations/:destination_id/edit' => 'companions#destroy', as: :remove_companion

end
