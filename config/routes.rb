Rails.application.routes.draw do

  resources :users, shallow: true do
    resources :galleries do
      resources :images
    end
  end

  root                'users#index'
  get    '/login'  => 'session#new'
  post   '/login'  => 'session#create'
  delete '/logout' => 'session#destroy'

end
