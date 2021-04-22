Rails.application.routes.draw do
  root "home#index"
  
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  
  devise_scope :user do 
    get 'users/profile' => 'users/registrations#profile', as: 'profile_user_registration'
    patch 'users/update' => 'users/registrations#profile_update', as: 'profile_update_user_registration'
  end
  
  # resources :users, :only => [:show]
  get 'users/mypage' => 'users#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
