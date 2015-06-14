Rails.application.routes.draw do
  root to: 'dashboard#splash'

  resources :deposits do
    resources :parts
  end

  devise_for :users
  resource :user
end
