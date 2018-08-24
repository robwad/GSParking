Rails.application.routes.draw do
  resources :people
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/baytallies', to: 'baytallies#index'

  get '/choosebay', to: 'booking#choosebay'
  get '/enterdetails', to: 'booking#enterdetails'
  get '/bookingconfirmation', to: 'booking#bookingconfirmation'

  get '/landing', to: 'gifting#landing'
  post '/profile', to: 'gifting#profile'
  post '/bookingconfirmation', to: 'booking#bookingconfirmation'
  get '/profile', to: 'gifting#profile'
  get '/login', to: 'gifting#login'
  post '/log_user_in', to: 'gifting#log_user_in'
  post '/checkdetails', to: 'booking#checkdetails'
  get '/button1', to: 'booking#button1'
  get '/button2', to: 'booking#button2'
  get '/button3', to: 'booking#button3'
  get '/item1', to: 'gifting#item1'
  get '/item2', to: 'gifting#item2'



  resources :users
end
