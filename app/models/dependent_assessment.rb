class DependentAssessment
  include ActiveModel::Model
  include ActiveModel::Validations

  attr_accessor :dependent, :user_id

  def initialize
  end

  def new_preparation
  end

  def run_all_checks
  end
end
