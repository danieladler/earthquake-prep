class AssessmentController < ApplicationController

  def assessment_form
    if !current_user
      redirect_to root_path, notice: "You must be signed in to take the assessment"
    else
      current_user = User.find(session[:user_id])
    end

    if !Home.find_by(user_id: current_user.id)
      @home = Home.new(user_id: current_user.id)
      @home.save
    else
      @home = Home.find_by(user_id: current_user.id)
    end

    @dependents = Dependent.find_by(user_id: current_user.id)

    @contacts = Contact.find_by(user_id: current_user.id)

    # 3 universal gear preps created on form opening
    @ga = GearAssessment.new(current_user)
    gear_keywords = %w(flashlight pocket_radio clothes)
    gear_keywords.each do |k|
      @ga.create_and_check(k)
    end
    # 3 said preps are given unique instance variable names so that
    @flashlight_prep = Preparation.includes(:question).where(questions: {keyword: "flashlight"}, user_id: current_user.id).references(:questions).first
    @pocket_radio_prep = Preparation.includes(:question).where(questions: {keyword: "pocket_radio"}, user_id: current_user.id).references(:questions).first
    @clothes_prep = Preparation.includes(:question).where(questions: {keyword: "clothes"}, user_id: current_user.id).references(:questions).first
    # ^^^ end above
  end
end
