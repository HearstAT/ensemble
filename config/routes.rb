Rails.application.routes.draw do
  root 'pager_duty_reports#index'
  
  devise_for :admin_users, {class_name: 'User'}.merge(ActiveAdmin::Devise.config)
  ActiveAdmin.routes(self)
  devise_for :users
  resources :users
  resources :pager_duty_incidents
  resources :new_relic_reports
  resources :chef_server_reports
  resources :pager_duty_reports
  resources :users
  resources :contacts
  resources :charts, only: [] do
    collection do
      get 'mttr_by_month'
      get 'mtta_by_month'
      get 'incident_minutes_by_month'
      get 'availability_by_month'
      get 'number_of_incidents_by_month'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
