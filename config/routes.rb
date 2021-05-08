Rails.application.routes.draw do
  get 'profiles/new'
  root "home#index"
  
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  
  resources :users, only: [:new, :create, :show]
  resources :profiles, only: [:new, :create, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
