Rails.application.routes.draw do
  root "home#home"
  
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
  }
  
  devise_scope :user do
    get "signup", to: "users/registrations#new"
    get "signin", to: "users/sessions#new"
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
  resources :rooms
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
