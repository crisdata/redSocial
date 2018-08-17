class Users::OmniauthCallbacksController < ApplicationController

  def facebook
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      @user.remember_me = true
      sign_in_and_redirect @user, event: :authentication
    end

    session['devise.auth'] = request.env['omniauth.auth']

    render :edit

  end

  def custom_sign_up
    @user = User.from_omniauth(session['devise.auth'])
    # aqui continuamos con los parámetros fuertes
    @user.update(params[:user])
  end

  private

  def user_params
    # Strong Params
    params.require(:user).permit(:name, :username, :email)
  end
end

# update({}) # Actualizar
# new({}) # Instalar
# create({}) # Instanciar y guardar
#
# params # Hash {authenticity_token:"",user:{email:"",username:"",name:""}}
