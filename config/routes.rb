Rails.application.routes.draw do
  get 'slots/new'
  get 'rooms/home'
  get 'sessions/new'
  root 'static_pages#home'
  get '/adduser', to: 'srecord#new'
  get '/showSlotUsers', to: 'srecord#show'
  get '/addtoslot', to: 'srecord#new'
  post '/addtoslot', to: 'srecord#create'
  get '/response', to: 'urecords#yes'
  get '/responseno', to: 'urecords#no'
#  get '/addmeeting', to:'meetings#create', as: 'addmeeting'
#post '/addmeeting', to:'meetings#create'
  get '/showroom', to: 'rooms#show'
   get  '/help',    to: 'static_pages#help'
   get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
post   '/login',   to: 'sessions#create'
delete '/logout',  to: 'sessions#destroy'
get '/newroom', to: 'rooms#new'
post '/newroom', to: 'rooms#create'
 resources :invites, only: [:edit]
  resources :users
    resources :rooms do
    resources :slots
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
