Rails.application.routes.draw do
  devise_for :players
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#index'

  resources :games, only: [:create, :show, :new] do
    resources :guesses, only: [:create, :new]
  end

  resources :guesses, only: [:new, :create]

  mount ActionCable.server => '/cable'
end
