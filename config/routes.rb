require 'sidekiq/web'

Rails.application.routes.draw do
  # Incluir aqui verificação se user é administrador
  # para montar o painel do sidekiq
  if Rails.env.development?
    mount Sidekiq::Web => '/sidekiq'
  end
  
  devise_for :users, :controllers => { registrations: 'registrations' }
  root 'pages#home'

  resources :campaigns, except: [:new] do
    post 'raffle', on: :member # --> /campaigns/:id/raffle
    # post 'raffle', on: :collection # -->  /campaigns/raffle
  end

  resources :members, only: [:create, :destroy, :update]

  # Nesta rota não passo :id, passo o token, por isso
  # não está no resources members.
  get 'members/:token/opened', to: 'members#opened'
end
