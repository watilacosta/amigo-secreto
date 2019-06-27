require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }

  # Incluir aqui verificação se user é administrador
  # para montar o painel do sidekiq
  mount Sidekiq::Web => '/sidekiq'
end
