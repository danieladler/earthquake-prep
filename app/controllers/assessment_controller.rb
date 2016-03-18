class AssessmentController < ApplicationController

  def assessment_form
    if !current_user
      redirect_to root_path, notice: "You must be signed in to take the assessment"
    else
      current_user = User.find(session[:user_id])
    end

    if !Home.find_by(user_id: current_user.id)
      @home = Home.new(user_id: current_user.id)
      @home.save
    else
      @home = Home.find_by(user_id: current_user.id)
    end
  end
end
