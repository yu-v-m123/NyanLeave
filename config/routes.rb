Rails.application.routes.draw do
  root "home#home"
  
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  
  devise_scope :user do
    get "signup", to: "users/registrations#new"
    get "signin", to: "users/sessions#new"
  end

  resources :users, only: [:new, :create, :show]
  resources :profiles, only: [:new, :create, :edit, :update]
  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
