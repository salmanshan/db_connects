Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount Blazer::Engine, at: "blazer"

  resources :databases
  root 'home#index'
  # get '/restart', to: 'application#restart'
  post '/save_db', to: 'home#save_db'
  get '/delete_db/:name', to: 'home#delete_db'
end
