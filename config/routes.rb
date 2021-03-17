Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :articles do
    resources :vote, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "articles#index"

  get 'all', to: 'articles#all', as: 'all'
end
