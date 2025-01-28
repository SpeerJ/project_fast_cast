class UsersController < ApplicationController
  allow_unauthenticated_access only: %i[ new create ]

  def new
    @user = User.new
  end

  def create
    role_param_keys = [ :cd, :agent, :actor ]
    cd, agent, actor = user_params.extract!(role_param_keys).values.map{ |x| x == 1 }
    role_param_keys << :actor_functionality unless actor # To delete actor functionality if it's not an actor


    @user = User.create!(user_params.except(*role_param_keys))
    #PasswordsMailer.reset(@user).deliver_later # todo: add password conf

    redirect_to new_session_url, notice: "User Created"
  end

  private

  def user_params
    params.require(:user).permit(:email_address, :password, :locale, :cd, :agent, :actor, actor_functionality: [:about_me, :name, :city])
  end
end
