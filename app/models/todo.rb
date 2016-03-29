class Todo
  include ActiveModel::Model
  include ActiveModel::Validations

  attr_accessor :user_id, :completed_preps, :total_preps, :all_prep_progress

  def initialize(user_id)
    @user_id           = user_id
    @completed_preps   = self.completed_all_preps
    @total_preps       = self.total_all_preps
    @all_prep_progress = self.all_prep_progress
  end

  def current_user
    User.find(self.user_id)
  end

  def completed_all_preps
    completed_preps = [
        @comp_home_preps      ||= current_user.home_preparations.where(completed: true).count,
        @comp_dependent_preps ||= current_user.dependent_preparations.where(completed: true).count,
        @comp_gear_preps      ||= current_user.gear_preparations.where(completed: true).count,
        @comp_contact_preps   ||= current_user.contact_preparations.where(completed: true).count
      ]
    completed_total = completed_preps.inject(:+)
  end

  def total_all_preps
    all_preps = [
        @all_home_preps      ||= current_user.home_preparations.count,
        @all_dependent_preps ||= current_user.dependent_preparations.count,
        @all_gear_preps      ||= current_user.gear_preparations.count,
        @all_contact_preps   ||= current_user.contact_preparations.count
      ]
    all_total = all_preps.inject(:+)
  end

  def all_prep_progress
    (completed_all_preps.to_f/total_all_preps.to_f)*100.round(2)
  end
end
