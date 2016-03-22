class UsersController < ApplicationController

  def sign_up
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:username, :email, :password, :password_confirmation))
    # @user = User.new
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Registration Successful. Welcome to Ready.City!"
    else
      render :sign_up
    end
  end

end
