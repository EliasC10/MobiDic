Rails.application.routes.draw do
  post 'login', to: 'supervisors#login'
  post 'clients', to: 'clients#index'
  post 'categories', to: 'categories#index'
  post 'entries', to: 'entries#index'
  resources :entry_categories
  resources :client_entries
  resources :institutions
  resources :supervisors
  root 'welcome#index'

end
