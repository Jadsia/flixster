Rails.application.routes.draw do
  devise_for :users
  devise_for :views
  root 'static_pages#index'
  namespace :instructor do
    resources :courses, only: [:new, :create, :show]
  end
  
  root to: 'home#index'
end
