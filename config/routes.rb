Rails.application.routes.draw do

  resources :users
  resources :galleries, except: [:index, :destroy] do
    resources :images, only: [:show]
    member do
      get  '/share' => 'galleries#sharing_prompt'
      post '/share' => 'galleries#share'
    end
  end
  resources :images

  root              'session#stage'
  get  '/login'  => 'session#new'
  post '/login'  => 'session#create'
  get  '/logout' => 'session#destroy'

end
