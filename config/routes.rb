Rails.application.routes.draw do
  root "home#index"
  
  devise_for :users => {
    :sessions => "users/sessions"
  }
  
  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
