Rails.application.routes.draw do
  resources :new_relic_reports
  resources :chef_server_reports
  resources :pager_duty_reports
  resources :new_relic_configs
  resources :chef_configs
  resources :pager_duty_configs
  resources :users
  resources :contacts
  resources :business_units
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
