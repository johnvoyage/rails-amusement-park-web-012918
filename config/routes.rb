Rails.application.routes.draw do

  root 'welcome#new'

  resources :users
  # , only: [:new, :create, :show]
  get '/signin', to: 'sessions#index'
  post'/signin', to: 'sessions#create'
  post 'signout', to: 'sessions#destroy'

end
