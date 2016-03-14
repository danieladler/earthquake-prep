class HomeAssessmentController < ApplicationController

  def home_info
    if !Home.find_by(user_id: @current_user.id)
      @home = Home.new(user_id: @current_user.id)
      @home.save
    else
      @home = Home.find_by(user_id: @current_user.id)
    end
  end

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
    if @home.save
      redirect_to home_info_path
    else
      render :home_info
    end
  end

  # methods to check attributes of home and assign todo steps follow here
end
