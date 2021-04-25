Rails.application.routes.draw do
  get 'home/index'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #
  root to: 'home#index'
  
  get 'api/v1/users/get_current_user'
  #root to: 'home#index'

  namespace :api, {format: 'json'} do
    namespace :v1 do
      resources :points, only: [:index, :show, :create]
    end
  end

  namespace :api, {format: 'json'} do
    namespace :v1 do
      resources :users, only: [:index]
    end
  end
end