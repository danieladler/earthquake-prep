class GearAssessmentController < ApplicationController
  def update_gear
    # raise
    gear_asmt_checks(current_user)
    render nothing: true
  end

  def gear_asmt_checks(user)
    @ga = GearAssessment.new(user)
    # create preps for the 3-4 things asked in the form
    form_keywords = %(radio clothes)
    @ga.create_and_check()
    # raise
    # end preliminary prep creation from form
    @ga.run_all_checks
  end
end
