Rails.application.routes.draw do
  get 'welcome/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'companies/index'
  resources :companies
  resources :employees
  resources :branches
  resources :managers
  resources :login
  root 'login#index'
end
