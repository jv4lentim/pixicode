Rails.application.routes.draw do
  resources :albums, except: [:show, :destroy, :update, :edit]
  get '/albums/:unique_id', to: 'albums#show', as: :show_album
  delete '/albums/:unique_id', to: 'albums#destroy', as: :destroy_album
  get '/albums/:unique_id/edit', to: 'albums#edit', as: :edit_album
  patch '/albums/:unique_id', to: 'albums#update', as: :update_album

  resource :session
  resources :passwords, param: :token
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root 'dashboard/home#index'

  namespace :dashboard, path: "dashboard" do
    get "/", to: "home#index", as: :home
    resources :albums, only: [:index, :show] do
      resources :photos, only: [:create, :destroy]
    end
  end
end
