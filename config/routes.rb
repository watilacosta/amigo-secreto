require 'sidekiq/web'

Rails.application.routes.draw do
  get 'campaigns/show'
  get 'campaigns/index'
  get 'campaigns/create'
  get 'campaigns/update'
  get 'campaigns/destroy'
  get 'campaigns/raffle'
  get 'pages/home'
  get 'members/crate'
  get 'members/destroy'
  get 'members/update'
  devise_for :users, :controllers => { registrations: 'registrations' }

  # Incluir aqui verificação se user é administrador
  # para montar o painel do sidekiq
  mount Sidekiq::Web => '/sidekiq'
end
