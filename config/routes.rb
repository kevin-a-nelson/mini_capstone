  Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    get '/products/:id' => 'products#show'
    post '/products' => 'products#create'
    patch '/products/:id' => 'products#update'
    delete '/products/:id' => 'products#destroy'

    post '/users' => 'users#create'
    get '/users/:id' => 'users#show'

    post '/sessions' => 'sessions#create'

    get '/orders' => 'orders#index'
    get '/orders/:id' => 'orders#show'
    post '/orders' => 'orders#create'
    delete '/orders/:id' => 'orders#destroy'

    get '/carted_products' => 'carted_products#index'
    post '/carted_products' => 'carted_products#create'
  end

  get '/products/new' => 'products#new'
  post '/products' => 'products#create'

  get '/products' => 'products#index'
  get '/products/:id' => 'products#show'

  get '/products/:id/edit' => 'products#edit'
  patch '/products/:id' => 'products#update'

  delete '/products/:id' => 'products#destroy'
end
