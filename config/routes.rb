Rails.application.routes.draw do
  devise_for :users, path_names: {
      sign_in: 'login'
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'application#index'

  # Posts
  resources :posts

  as :user do
    get 'login/' => 'devise/sessions#new', as: :login
  end
end
