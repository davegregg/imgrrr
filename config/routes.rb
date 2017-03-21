Rails.application.routes.draw do

  resources :users
  resources :images
  resources :galleries, except: [:index, :destroy] do
    resources :images, only: [:show]
    member do
      # get  'shares/new'    => 'galleries#new_share',    as: :new_share
      get  'shares/create' => 'galleries#create_share', as: :create_share
    end
  end

  root              'session#stage'
  get  '/login'  => 'session#new'
  post '/login'  => 'session#create'
  get  '/logout' => 'session#destroy'

end
