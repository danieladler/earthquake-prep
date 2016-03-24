class DependentAssessment
  include ActiveModel::Model
  include ActiveModel::Validations

  attr_accessor :dependent, :dependent_id, :user_id

  def initialize(dependent)
    @dependent    = dependent
    @dependent_id = dependent.id
    @user_id      = dependent.user_id
  end

  def new_preparation
    @preparation = Preparation.new(user_id: user_id, prep_id: dependent_id, prep_type: "Dependent")
  end

  def create_and_check(keyword)
    new_preparation
    @preparation.question = Question.find_by(keyword: keyword)
    @preparation.save
  end

  def run_all_checks
    human_only_keywords = %w(drill responsibilities meetup_home meetup_neighborhood)

    pet_only_keywords = %w(pet_hotel shelter_ready microchip)

    if self.dependent.human
      human_only_keywords.each do |k|
        create_and_check(k)
      end
    elsif !self.dependent.human
      pet_only_keywords.each do |k|
        create_and_check(k)
      end
    end
  end
end
