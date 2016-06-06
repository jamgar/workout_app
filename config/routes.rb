Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  get 'dashboard/index'
  
  resources :users do
    resources :exercises
  end
  
  resource :dashboard, only: [:index] do
    collection do
      post :search, to: 'dashboard#search'
    end
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root to: 'dashboard#index'

end
