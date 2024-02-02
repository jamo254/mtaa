Rails.application.routes.draw do
  devise_for :accounts
  get "u/:username" => "home#profile", as: :profile
  resources :communities do
    resources :posts
  end
  resources :subscriptions
  # Defines the root path route ("/")
  root to: "home#index"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

end
