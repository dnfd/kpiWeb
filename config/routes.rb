Rails.application.routes.draw do
  resources :links, defaults: { format: 'json' }
  resources :users, defaults: { format: 'json' }
  resources :session, only: %i[create], defaults: { format: 'json' } do
    delete :destroy, on: :collection
  end

  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  mount ActionCable.server => '/cable'

  require 'resque/server'
  mount Resque::Server => '/jobs'
  require 'resque_web'
  mount ResqueWeb::Engine => '/resque'

  get '/:url', to: 'redirect#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root 'home#index'
end
