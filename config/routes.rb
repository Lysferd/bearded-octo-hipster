Videoserver3::Application.routes.draw do

  # -=-=-=-=-
  # Define routes.
  root to: 'home#index', as: 'home'
  get 'index' => 'home#index'
  get 'live' => 'home#live'
  get 'error' => 'home#error'
  get 'playback' => 'home#playback'
  get 'admin' => 'admin#index'

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  # -=-=-=-=-
  # Define resources.
  resources :users
  resources :servers
  resources :cameras
  resources :warehouses

end
