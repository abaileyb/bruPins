Rails.application.routes.draw do

  devise_for :users

  resources :welcome

  root 'welcome#index'

  resources :users do
  	resources :boards
  end

  resources :boards do
  	resources :pins
  end

  resources :pins do
  	resources :boards
  end
end
