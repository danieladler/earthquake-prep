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
    @dependent.destroy
    dep_preps = Preparation.where(user_id: current_user.id, prep_type:"Dependent")
    if current_user.no_human_dependents
      dep_preps.each do |p|
        p.destroy if (%(drill responsibilities meetup_home meetup_neighborhood)).include? p.question.keyword
      end
    end

    if current_user.no_pet_dependents
      dep_preps.each do |p|
        p.destroy if (%(pet_hotel shelter_ready microchip)).include? p.question.keyword
      end
    end
    render nothing: true
  end

  def dep_asmt_checks(dependent)
    @da = DependentAssessment.new(dependent)
    @da.run_all_checks
  end
end
