Rails.application.routes.draw do
  get 'slots/new'
  get 'rooms/home'
  get 'sessions/new'
  root 'static_pages#home'
  get '/adduser', to: 'srecords#new'
  get '/showSlotUsers', to: 'srecords#show'
  get '/addtoslot', to: 'srecords#new'
  post '/addtoslot', to: 'srecords#create'
  get '/response', to: 'urecords#yes'
  get '/responseno', to: 'urecords#no'
  get '/showroom', to: 'rooms#show'
   get  '/help',    to: 'static_pages#help'
   get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
post   '/login',   to: 'sessions#create'
delete '/logout',  to: 'sessions#destroy'
get '/newroom', to: 'rooms#new'
post '/newroom', to: 'rooms#create'
  resources :users do
    resources :urecords
  end
    resources :rooms do
    resources :slots do
      resources :srecords
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
