Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'identification#info'

  get '/information_to_connects', to: 'identification#get_code'
  get '/get_token', to: 'identification#get_token'
end
