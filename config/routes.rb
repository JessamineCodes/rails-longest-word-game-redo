Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  get "new", to: "games#new"
  # don't need a get in order to create a page to redirect to when post-ing,
  # but won't be able to get to it with a straight get request, ie by typing in link
  post "score", to: "games#score"
end
