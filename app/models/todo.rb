class Todo
  include ActiveModel::Model
  include ActiveModel::Validations

  attr_accessor :user_id

  def initialize(user_id)
    @user_id = user_id
  end

  def current_user
    User.find(self.user_id)
  end

  # all preparations - summary
  def completed_all_preps
    completed_home_preps + completed_dependent_preps# + completed_OTHER_preps
  end

  def total_all_preps
    total_home_preps + total_dependent_preps# + total_OTHER_preps
  end

  def all_prep_progress
    completed_all_preps/total_all_preps
  end

  # home preparations
  def completed_home_preps
    current_user.home_preparations.where(completed?: true).count.to_f
  end

  def total_home_preps
    current_user.home_preparations.count.to_f
  end

  def home_prep_progress
    completed_home_preps/total_home_preps
  end

  # dependent preparations
  def completed_dependent_preps
    current_user.dependent_preparations.where(completed?: true).count.to_f
  end

  def total_dependent_preps
    current_user.dependent_preparations.count.to_f
  end

  def dependent_prep_progress
    completed_dependent_preps/total_dependent_preps
  end

  # contact preparations
  def completed_contact_preps
    current_user.contact_preparations.where(completed?: true).count.to_f
  end

  def total_dependent_preps
    current_user.contact_preparations.count.to_f
  end

  def dependent_prep_progress
    completed_contact_preps/total_contact_preps
  end

  # gear preparations
end
