Rails.application.routes.draw do
  devise_for :users
  get 'dashboard/index'
  
  resources :users do
    resources :exercises
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root to: 'dashboard#index'

end
