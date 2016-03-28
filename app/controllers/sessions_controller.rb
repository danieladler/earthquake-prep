class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user == nil
      redirect_to root_path, notice: "Wrong username or password"
    elsif @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to root_path, notice: "Wrong username or password"
    end

  end

  def sign_out
    session.delete(:user_id)
    redirect_to root_path #, notice: "Signed out"
  end
end
