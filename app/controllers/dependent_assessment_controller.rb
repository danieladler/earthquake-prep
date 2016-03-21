class DependentAssessmentController < ApplicationController

  def update_dependents
    @dependents ||= Dependent.where(user_id: current_user.id)
    raise
    @dependents.each do |d|
      d.update_db_values(params)
      raise
      @dependent.save
    end
    # TRY OUT BELOW CODE ONCE DEPENDENT ASSESSMENT IN PLACE:
    # if @dependent.save
    #   dep_asmt_checks(@dependent)
    # else
    #   render "assessment/assessment_form"
    # end
    render nothing: true
  end

  def dep_asmt_checks(dependents)
  end
end
