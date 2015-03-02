Rails.application.routes.draw do
  get 'access/login'

  get 'access/signup'

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

  root 'access#login'

  # Adding and removing destination to/from a single itinerary
  post '/itineraries/:id/destinations/new' => 'destinations#create', as: :add_destination
  delete '/itineraries/:id/destinations/:destination_id' => 'destinations#destroy', as: :remove_destination



end

# access_login GET    /access/login(.:format)                                 access#login
#        access_signup GET    /access/signup(.:format)                                access#signup
#                login GET    /login(.:format)                                        access#login
#               signup GET    /signup(.:format)                                       access#signup
#                      POST   /login(.:format)                                        access#attempt_login
#                      POST   /signup(.:format)                                       access#create
#               logout GET    /logout(.:format)                                       access#logout
#   itinerary_comments POST   /itineraries/:itinerary_id/comments(.:format)           comments#create
#          itineraries GET    /itineraries(.:format)                                  itineraries#index
#                      POST   /itineraries(.:format)                                  itineraries#create
#        new_itinerary GET    /itineraries/new(.:format)                              itineraries#new
#       edit_itinerary GET    /itineraries/:id/edit(.:format)                         itineraries#edit
#            itinerary GET    /itineraries/:id(.:format)                              itineraries#show
#                      PATCH  /itineraries/:id(.:format)                              itineraries#update
#                      PUT    /itineraries/:id(.:format)                              itineraries#update
#                      DELETE /itineraries/:id(.:format)                              itineraries#destroy
# destination_comments POST   /destinations/:destination_id/comments(.:format)        comments#create
#         destinations GET    /destinations(.:format)                                 destinations#index
#                      POST   /destinations(.:format)                                 destinations#create
#      new_destination GET    /destinations/new(.:format)                             destinations#new
#     edit_destination GET    /destinations/:id/edit(.:format)                        destinations#edit
#          destination GET    /destinations/:id(.:format)                             destinations#show
#                      PATCH  /destinations/:id(.:format)                             destinations#update
#                      PUT    /destinations/:id(.:format)                             destinations#update
#                      DELETE /destinations/:id(.:format)                             destinations#destroy
#                 root GET    /                                                       access#login
#      add_destination POST   /itineraries/:id/destinations/new(.:format)             destinations#create
#   remove_destination DELETE /itineraries/:id/destinations/:destination_id(.:format) destinations#destroy
