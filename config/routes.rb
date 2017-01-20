Rails.application.routes.draw do
  
  
  devise_for :users
  resources :pager_duty_incidents
  resources :new_relic_reports
  resources :chef_server_reports
  resources :pager_duty_reports
  resources :new_relic_configs
  resources :chef_configs
  resources :pager_duty_configs
  resources :users
  resources :contacts
  resources :business_units
  resources :charts, only: [] do
    collection do
      get 'mttr_by_month'
      get 'mtta_by_month'
      get 'incident_minutes_by_month'
      get 'availability_by_month'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
