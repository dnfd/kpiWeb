Rails.application.routes.draw do
  resources :links
  resources :users
  resources :session, only: %i[create] do
    delete :destroy, on: :collection
  end

  get 'home/index'

  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root 'home#index'
end
