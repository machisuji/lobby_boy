module LobbyBoy
  class Engine < ::Rails::Engine
    isolate_namespace LobbyBoy

    config.assets.precompile += %w( jquery.js js.cookie-1.5.1.min.js )

    config.to_prepare do
      require 'lobby_boy/patches/session_management'
    end

    ##
    # Use CORS to allow AJAX re-reauthentication.
    initializer 'lobby_boy.add_middleware' do |app|
      require 'rack/cors'

      app.middleware.insert_before 0, 'Rack::Cors' do
        allow do
          omniauth = ::OmniAuth.config.path_prefix

          origins '*'
          resource "#{omniauth}/*", headers: :any, methods: [:get], credentials: true
        end

        allow do
          origins '*'
          resource '/session/*', headers: :any, methods: [:get], credentials: true
        end
      end
    end
  end
end
