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
    completed_home_preps # + completed_OTHER_preps
  end

  def total_all_preps
    total_home_preps # + total_OTHER_preps
  end

  def all_prep_progress
    home_prep_progress # + OTHER_prep_progress
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

  # gear preparations
  # contact preparations
  # dependent preparations
end
