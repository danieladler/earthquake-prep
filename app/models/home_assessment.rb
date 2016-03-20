class HomeAssessment
  include ActiveModel::Model
  include ActiveModel::Validations

  attr_accessor :home, :user_id, :home_id

  def initialize(home)
    @home = home
    @user_id = home.user_id
    @home_id = home.id
  end

  def new_preparation
    @preparation = Preparation.new(user_id: user_id, prep_id: home_id, prep_type: "Home")
  end

  def create_and_check(keyword)
    new_preparation
    @preparation.question = Question.find_by(keyword: keyword)
    @preparation.save
  end

  def run_all_checks
    common_keywords = %w(furniture water_heater gas_heater hanging decor cabinets
    gas_shutoff water_shutoff electricity_shutoff shutoff_tool extinguisher
    flammable_liquids)

    house_only_keywords = %w(pipes foundation)

    common_keywords.each do |k|
      create_and_check(k)
    end

    if self.home.is_house?
      house_only_keywords.each do |k|
        create_and_check(k)
      end
    end
  end
end
