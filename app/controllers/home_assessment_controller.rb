class HomeAssessmentController < ApplicationController

  def update_home
    @home                         ||= Home.find_by(user_id: current_user.id)
    @home.update_db_values(params)
    if params[:home_type] == "apartment"
      @home.remove_non_apt_fields(params)
      @home.is_house = false
    elsif params[:home_type] == "house"
      @home.is_house = true
    end
    if @home.save
      home_asmt_checks(@home)
    else
      render "assessment/assessment_form"
    end
    render nothing: true
  end

  def home_asmt_checks(home)
    @ha = HomeAssessment.new(home)
    @ha.run_all_checks
  end
end
