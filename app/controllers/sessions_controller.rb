class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user == nil
      redirect_to root_path, notice: "Wrong username or password"
    else
      session[:user_id] = @user.id
      redirect_to root_path
    end
  end

  def sign_out
    session.delete(:user_id)
    redirect_to root_path, notice: "Signed out"
  end
end
