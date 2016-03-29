class GearAssessmentController < ApplicationController
  def update_gear
    gear_asmt_checks(current_user)
    render nothing: true
  end

  def gear_asmt_checks(user)
    @ga = GearAssessment.new(user)
    @ga.run_all_checks
  end
end
