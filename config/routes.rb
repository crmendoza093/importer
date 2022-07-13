Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get '/v1/importer/', to: 'v1/importer#load'
  get '/v1/list/:postal_code', to: 'v1/importer#list'
end
