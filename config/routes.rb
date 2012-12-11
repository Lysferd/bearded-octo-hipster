Videoserver3::Application.routes.draw do

  # -=-=-=-=-
  # Define routes.
  root to: 'home#index', as: 'home'
  get 'index' => 'home#index'
  get 'live' => 'home#live'
  get 'playback' => 'home#playback'
  get 'error' => 'home#error'

  get 'admin' => 'admin#index'

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  controller :cameras do
    get :upload
  end

  # -=-=-=-=-
  # Define resources.
  resources :users
  resources :servers
  resources :cameras do
    get :batch_new, on: :collection
  end
  resources :warehouses

end
