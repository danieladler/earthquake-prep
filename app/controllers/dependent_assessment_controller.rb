class DependentAssessmentController < ApplicationController

  def add_dependent
    @dependent = Dependent.new(user_id: current_user.id)
    @dependent.update_db_values(params)
    if @dependent.save
      render nothing: true
    else
      render "assessment/assessment_form", notice: "error saving dependent"
    end

    # TRY OUT BELOW CODE ONCE DEPENDENT ASSESSMENT IN PLACE:
    # if @dependent.save
    #   dep_asmt_checks(@dependent)
    # else
    #   render "assessment/assessment_form"
    # end
    # render nothing: true
  end

  def dep_asmt_checks(dependents)
  end
end
