Rails.application.routes.draw do
  post 'login', to: 'supervisors#login'
  post 'clients', to: 'clients#index'
  post 'categories', to: 'categories#index'
  post 'entries', to: 'entries#index'
  post 'entries/new', to: 'entries#new'
  post 'entries/delete', to: 'entries#delete'
  root 'welcome#index'

end
