Rails.application.routes.draw do

  resources :users
  resources :galleries do
    resources :images, only: [:show]
  end
  resources :images

  root                'session#stage'
  get    '/login'  => 'session#new'
  post   '/login'  => 'session#create'
  get    '/logout' => 'session#destroy'

  # post   '/galleries/:gallery_id/images/:image_id/add(.:format)'
  ## may not need this, could maybe use images#edit or galleries#edit

end
