class DependentAssessmentController < ApplicationController

  def add_dependent
    @dependent = Dependent.new(user_id: current_user.id)
    @dependent.update_db_values(params)
    if @dependent.save
      dep_asmt_checks(@dependent)
    else
      render "assessment/assessment_form"
    end
    render nothing: true
  end

  def remove_dependent
    @dependent = Dependent.find_by(id: params[:id])
    if @dependent.destroy
      render nothing: true
    else
      # ??
    end
  end

  def dep_asmt_checks(dependent)
    @da = DependentAssessment.new(dependent)
    @da.run_all_checks
  end
end
