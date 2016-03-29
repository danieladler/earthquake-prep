class GearAssessment
  include ActiveModel::Model
  include ActiveModel::Validations

  attr_accessor :user, :user_id

  def initialize(user)
    @user    = user
    @user_id = user.id
  end

  def new_preparation
    @preparation = Preparation.new(user_id: user_id, prep_type: "Gear")
  end

  def create_and_check(keyword)
    new_preparation
    @preparation.question = Question.find_by(keyword: keyword)
    @preparation.save
  end

  def run_all_checks
    common_keywords = %w(clothes backpack flashlight mess_kit food_days h20_gal
    camp_stove can_opener h20_tablets cash matches handbook batteries pocket_tool
    pocket_radio glasses first_aid_kit specialty_meds tp toilets sanitizer
    id bank insurance tent sleeping_bag work_gloves)

    pet_keywords = %w(pet_food pet_meds pet_crate)

    if self.user.dependents.where(human: false)
      pet_keywords.each do |k|
        create_and_check(k)
      end
    end

    common_keywords.each do |k|
      create_and_check(k)
    end
  end
end
