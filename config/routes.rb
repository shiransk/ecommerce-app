Rails.application.routes.draw do
#products routes
get '/' , to: 'products#index'
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

#user routes

get '/singup' , to: 'users#new'
post '/users', to: 'users#create'

#session routes
get '/login' ,to: 'sessions#new'
post '/login', to: 'sessions#create'
delete '/logout', to: 'sessions#destroy'
end
