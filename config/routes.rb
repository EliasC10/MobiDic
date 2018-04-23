Rails.application.routes.draw do
  resources :categories
  resources :entry_categories
  resources :entries
  resources :client_entries
  resources :clients
  resources :institutions
  resources :supervisors
 root 'welcome#index'
end
