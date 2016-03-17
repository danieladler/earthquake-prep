class HomeAssessmentController < ApplicationController

  def update_home
    @home                         = Home.find_by(user_id: @current_user.id)
    @home.update_db_values(params)
    home_asmt_checks(@home)
    render nothing: true
  end

  def home_asmt_checks(home)
    @ha     = HomeAssessment.new(home)
    @ha.run_all_checks
  end
end
