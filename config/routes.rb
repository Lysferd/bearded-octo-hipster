Videoserver3::Application.routes.draw do

  # -=-=-=-=-
  # Define routes.
  root to: 'home#index', as: 'home'
  get 'index' => 'home#index'
  get 'live' => 'home#live'
  get 'playback' => 'home#playback'
  get 'error_406' => 'home#error_406'
  get 'error_401' => 'home#error_401'
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
  resources :exclusive_cameras
  resources :warehouses

end
