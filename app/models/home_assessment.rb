class HomeAssessment

  attr_accessor :home, :user_id

  def initialize(home)
    @home = home
    @user_id = home.user_id
  end

  def create_preparation
    @preparation = home.preparations.new(user_id: user_id)
  end

  def run_all_checks
    furniture_anchored?
    water_heater_anchored?
  end

  def furniture_anchored?
    create_preparation
    @preparation.instructions = "Anchor heavy furniture to walls"
    @preparation.save
  end

  def water_heater_anchored?
    create_preparation
    @preparation.instructions = "Anchor water heater to wall"
    @preparation.save
  end

end
