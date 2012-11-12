Videoserver3::Application.routes.draw do

  # -=-=-=-=-
  # Define routes.
  root to: 'home#index'
  get 'home/index'
  get 'home/live'
  get 'home/playback'

  # -=-=-=-=-
  # Define resources.
  resources :servers
  resources :cameras
  resources :warehouses
end
