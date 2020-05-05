Rails.application.routes.draw do
  resources :events
  root to: 'home#show'
  get :signup, to: 'sessions#new'
  get '/auth/:provider/callback', to: 'sessions#create'
end
