require 'sidekiq/web'

Rails.application.routes.draw do

  root to: 'public#index'

  resources :contatos, only: [:new, :create]

  get '/sobre', to: 'apresentacao#sobre'

  resources :rastreamentos, only: [:index, :create]

  mount  Sidekiq::Web, at: '/sidekiq'

  match '*a', :to => 'errors#routing', via: :get

end
