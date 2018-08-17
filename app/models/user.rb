class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  def self.from_omniauth(auth)
    where(provider: auth['provider'], uid:auth['uid']).first_or_create do |user|
      if auth[:info]
        # user.email = auth[:info] [:email]
        user.name = auth[:info] [:name]
      end
      user.password = Devise.friendly_token[0,20]
    end
  end
end


# Tipos de metodos en programacion orientada a objetos:
# Clase => User.from_omniauth()
# Instancia => user = User.new ; user.from_omniauth()
