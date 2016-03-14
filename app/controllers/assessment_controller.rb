class AssessmentController < ApplicationController

  def user_info
    if !@current_user
      redirect_to root_path, notice: "You must be signed in to take the assessment"
    else
      @current_user = User.find(session[:user_id])
    end
  end

  def update_user
    redirect_to home_info_path
  end

  def home_info
  end

  def update_home
    @home                         = Home.find_by(user_id: @current_user.id)
    @home.structure["floors"]     = params["floor_count"].to_i
    @home.structure["year_built"] = params["year_built"].to_i
    if @home.save
      redirect_to home_info_path
    else
      render :home_info
    end
  end
end
