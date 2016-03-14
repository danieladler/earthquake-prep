class AssessmentController < ApplicationController

  def user_info
    if !@current_user
      redirect_to root_path, notice: "You must be signed in to take the assessment"
    else
      @current_user = User.find(session[:user_id])
    end
  end

  def update_user
    
  end
end
