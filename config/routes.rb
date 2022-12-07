Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # root "patterns#index"
  root to: "shortlinks#index"
  resources :shortlinks
  
  get "/csvfiles/new", to: "csvfile#new"
  get "/csvfiles", to: "csvfile#index"
  post 'csvfile/import_links'

  mount ActionCable.server => "/cable"

  post 'shortlinks/import_links'
  # Defines the root path route ("/")
  # root "articles#index"
  get "/:id", to: "shortlinks#show"
end
