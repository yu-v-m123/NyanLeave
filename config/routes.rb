Rails.application.routes.draw do
  root "home#home"

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
  }

  devise_scope :user do
    get "signup", to: "users/registrations#new"
    get "signin", to: "users/sessions#new"
    post 'guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  resources :users, only: [:new, :create, :show] do
    collection do
      get :likes
    end
  end
  resources :profiles, only: [:new, :create, :edit, :update]
  resources :posts do
    resource :likes, only: [:create, :destroy]
  end
  resources :cares, only: [:index, :show]
  get "cares/owner/:id", to: "cares#owner", as: "care_owner"
  post "cares/owner/:id/reviews", to: "reviews#create", as: "reviews"
  delete "cares/owner/:id/reviews/:id", to: "reviews#destroy", as: "review"
  resources :rooms
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
