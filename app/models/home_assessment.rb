class HomeAssessment
  include ActiveModel::Model
  include ActiveModel::Validations

  attr_accessor :home, :user_id

  def initialize(home)
    @home = home
    @user_id = home.user_id
  end

  def new_preparation
    @preparation = home.preparations.new(user_id: user_id)
  end

  def run_all_checks
    furniture_anchored?
    water_heater_anchored?
  end

  def furniture_anchored?
    new_preparation
    @preparation.instructions = "Anchor heavy furniture to walls"
    # if !@preparation.valid?
    #   redirect_to root_path, notice: "The preparation (#{@preparation.instructions}) already exists."
    # else
    @preparation.save
    # end
  end

  def water_heater_anchored?
    new_preparation
    @preparation.instructions = "Anchor water heater to wall"
    @preparation.save
  end

end
