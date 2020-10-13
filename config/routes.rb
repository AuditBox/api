Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :controls
  resources :assets
  resources :scopes
  resources :organizations, only: %i[new create show edit update]
  root 'home#index'
  get 'box/c/:control_id/a/:asset_id', to: 'boxes#show', as: :box
  get 'login', to: 'logins#new'
  get 'login/create', to: 'logins#create', as: :create_login
  get 'logout', to: 'logouts#new'
end
