Rails.application.routes.draw do
#products routes
get '/', to: 'products#index'
get '/products/popular_products', to: 'products#popular_products' 
get '/products' , to:'products#index'
get 'products/new', to:'products#new'
post '/products',   to: 'products#create'
get '/products/:id', to:'products#show'
get '/products/:id/edit', to:'products#edit'
patch '/products/:id', to:'products#update'
delete 'products/:id/', to:'products#destroy'
post 'products/search', to:'products#search'

#images routes
get '/images/new', to:'images#new'
post '/images', to: 'images#create'
delete '/images/:id', to:'images#destroy'

#user routes

get '/singup' , to: 'users#new'
post '/users', to: 'users#create'

#session routes
get '/login' ,to: 'sessions#new'
post '/login', to: 'sessions#create'
delete '/logout', to: 'sessions#destroy'

#orders controller
post '/orders', to: 'orders#create'
get '/orders/:id', to: 'orders#show'
patch 'orders', to:'orders#update'

#carted orders  
get '/carted_products', to:'carted_products#index'
post '/carted_products', to:'carted_products#create'
delete 'carted_products/:id', to: 'carted_products#destroy'
end
