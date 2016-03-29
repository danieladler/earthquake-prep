class GearAssessmentController < ApplicationController
  def update_gear
    gear_asmt_checks(current_user)
    render nothing: true
  end

  def gear_asmt_checks(user)
    @ga = GearAssessment.new(user)

    # update the 3 initial preps based on form inputs
    params[:preparations].each do |id, data|
      Preparation.find(id).update(completed: data[:completed])
    end

    # run the rest of the checks to create all other gear preps
    @ga.run_all_checks
  end
end
