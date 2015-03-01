Rails.application.routes.draw do
<<<<<<< HEAD
  get 'destinations/index'

  get 'destinations/show'

  get 'destinations/new'

  get 'destinations/edit'

root 'site#index'

=======
  get 'itineraries/new'

  get 'itineraries/edit'

  get 'itineraries/show'

  get 'itineraries/index'
>>>>>>> f760c3af533c1e7a0c762002ea6f0a66d6536fc8

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


  # # Adding and removing destination to/from a single itinerary
  # post '/itineraries/:id/destinations/new' => 'destinations#create', as: :add_destination
  # delete '/itineraries/:id/destinations/:destination_id' => 'destinations#destroy', as: :remove_destination

  # # Adding and removing a user/companion to/from an existing destination
  # post '/itineraries/:id/destinations/new' => 'companions#create', as: :add_companion
  # post '/itineraries/:id/destinations/:destination_id/edit' => 'companions#create', as: :add_companion
  # delete '/itineraries/:id/destinations/:destination_id' => 'companions#destroy', as: :remove_companion
  # delete '/itineraries/:id/destinations/:destination_id/edit' => 'companions#destroy', as: :remove_companion

end
