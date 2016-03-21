class DependentAssessment
  include ActiveModel::Model
  include ActiveModel::Validations

  attr_accessor :dependent, :user_id

  def initialize(dependent)
    @dependent    = dependent
    @dependent_id = dependent.id
    @user_id      = dependent.user_id
  end

  def new_preparation
    # @preparation = Preparation.new(user_id: user_id, prep_id: dependent_id, prep_type: "Dependent")
  end

  def run_all_checks
  end
end
