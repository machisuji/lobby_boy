require 'lobby_boy'

Rails.application.routes.draw do
  mount LobbyBoy::Engine, at: '/'

  get 'login/test', to: 'login#test'
end
