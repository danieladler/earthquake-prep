class HomeAssessment
  include ActiveModel::Model
  include ActiveModel::Validations

  attr_accessor :home, :user_id, :question_id

  def initialize(home)
    @home = home
    @user_id = home.user_id
  end

  def new_preparation
    # @preparation = home.preparations.new(user_id: user_id)
    @preparation = Preparation.new(user_id: user_id, home_id: home_id)
  end

  def create_and_check(keyword)
    new_preparation
    @preparation.question = Question.find_by(keyword: keyword)
    #
  end

  def run_all_checks
    # array of keywords
    #  arr.each create_and_check |k| 

    anchor_furniture
    anchor_water_heater
    anchor_gas_heater
    safe_hanging_audit
    safe_decor_audit
    latch_cabinets
    id_gas_shutoff
    id_water_shutoff
    id_electricity_shutoff
    shutoff_tool
    flam_liquids_outside
    if home.is_house?
      flexible_utility_pipes
      anchor_house_to_foundation
    end
  end

  # Checks that apply to both house and apartment dwellers
  def anchor_furniture
    new_preparation
    @preparation.question = Question.find_by(keyword:"furniture")
    @preparation.save
  end

  def anchor_water_heater
    new_preparation
    @preparation.question = Question.find_by(keyword:"water_heater")
    @preparation.save
  end

  def anchor_gas_heater
    new_preparation
    @preparation.question = Question.find_by(keyword:"gas_heater")
    @preparation.save
  end

  def safe_hanging_audit
    new_preparation
    @preparation.question = Question.find_by(keyword:"hanging")
    @preparation.save
  end

  def safe_decor_audit
    new_preparation
    @preparation.question = Question.find_by(keyword:"decor")
    @preparation.save
  end

  def latch_cabinets
    new_preparation
    @preparation.question = Question.find_by(keyword:"cabinets")
    @preparation.save
  end

  def id_gas_shutoff
    new_preparation
    @preparation.question = Question.find_by(keyword:"gas_shutoff")
    @preparation.save
  end

  def id_water_shutoff
    new_preparation
    @preparation.question = Question.find_by(keyword:"water_shutoff")
    @preparation.save
  end

  def id_electricity_shutoff
    new_preparation
    @preparation.question = Question.find_by(keyword:"electricity_shutoff")
    @preparation.save
  end

  def shutoff_tool
    new_preparation
    @preparation.question = Question.find_by(keyword:"shutoff_tool")
    @preparation.save
  end

  def fire_extinguisher
    new_preparation
    @preparation.question = Question.find_by(keyword:"extinguisher")
    @preparation.save
  end

  def flam_liquids_outside
    new_preparation
    @preparation.question = Question.find_by(keyword:"flammable_liquids")
    @preparation.save
  end

  # Checks that apply only to house dwellers
  def flexible_utility_pipes
    new_preparation
    @preparation.question = Question.find_by(keyword:"pipes")
    @preparation.save
  end

  def anchor_house_to_foundation
    new_preparation
    @preparation.question = Question.find_by(keyword:"foundation")
    @preparation.save
  end
end
