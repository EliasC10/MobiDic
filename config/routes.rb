Rails.application.routes.draw do
  post 'login', to: 'supervisors#login'
  post 'clients', to: 'clients#index'
  post 'categories', to: 'categories#index'
  resources :entry_categories
  resources :entries
  resources :client_entries
  resources :institutions
  resources :supervisors
  root 'welcome#index'

end
