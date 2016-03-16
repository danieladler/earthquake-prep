class HomeAssessmentController < ApplicationController
  def update_home
    @home                         = Home.find_by(user_id: @current_user.id)
    @home.structure["floors"]     = params["floor_count"].to_i
    @home.structure["year_built"] = params["year_built"].to_i
    @home.street_address          = params[:street_address]
    @home.city                    = params[:city]
    @home.state                   = params[:state]
    @home.zip                     = params[:zip]
    if params[:home_type] == "apartment"
      @home.update(is_house?: false)
      @home.structure.delete("fdn_bolted")
      @home.structure.delete("fdn_material")
      @home.structure.delete("chimney_material")
      @home.structure.delete("structure_material")
    else
      @home.update(is_house?: true)
    end
    # if @home.save
      home_asmt_checks(@home)
    #   redirect_to home_info_path
    # else
    #   render :home_info
    # end
  end

  def home_asmt_checks(home)
    @ha     = HomeAssessment.new(home)
    @ha.run_all_checks
    redirect_to assessment_form_path, notice: "Visit your to-do list for home preparations"
  end
end
