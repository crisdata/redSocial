Rails.application.routes.draw do

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  post '/custom_sign_up', to: 'users/omniauth_callbacks#custom_sign_up'

  # Si esta autenticado lo envio a la pagina de inicio
  authenticated :user do
    root 'main#home'
  end

  # Si no esta registrado lo envio a unregistered
  unauthenticated :user do
    root 'main#unregistered'
  end

  # 1. Mandar una peticion a facebook
  # 2. Facebook retornara a nuestra app callback_url
  # 3. Procesar la info de Facebook
  # 4. Autenticar al usuario o crear un nuevo usuario

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
