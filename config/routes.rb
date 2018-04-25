Rails.application.routes.draw do
  post 'login', to: 'supervisors#login'
  post 'clients', to: 'clients#index'
  post 'categories', to: 'categories#index'
  post 'entries', to: 'entries#index'
  root 'welcome#index'

end
