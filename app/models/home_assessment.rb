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

  # def example_anchor_furniture
  #   new_preparation
  #   @preparation.keyword = "furniture"
  #   @preparation.instructions = Question.where(keyword: @preparation.keyword).text
  #   @preparation.save
  # end

  # def example_2
  #   new_prep
  #   @preparation.question = Question.where(keyword: "keyword_here")
  #   @p.save
  # end

  def anchor_furniture
    new_preparation
    @preparation.instructions = "Bolt and brace heavy furniture to wall studs"
    # if !@preparation.valid?
    #   redirect_to root_path, notice: "The preparation (#{@preparation.instructions}) already exists."
    # else
    @preparation.save
    # end
  end

  def anchor_water_heater
    new_preparation
    @preparation.instructions = "Bolt and brace water heater to wall studs"
    @preparation.save
  end

  def anchor_gas_heater
    new_preparation
    @preparation.instructions = "Bolt and brace gas heater to wall studs"
    @preparation.save
  end

  def safe_hanging_audit
    new_preparation
    @preparation.instructions = "Move heavy picture frames and/or mirrors away from beds"
    @preparation.save
  end

  def safe_decor_audit
    new_preparation
    @preparation.instructions = "Move heavy and/or breakable objects that are kept on high shelves to lower places"
    @preparation.save
  end

  def latch_cabinets
    new_preparation
    @preparation.instructions = "Put latches on kitchen or other cabinets that will hold the door closed during shaking"
    @preparation.save
  end

  def id_gas_shutoff
    new_preparation
    @preparation.instructions = "Identify location of gas shutoff and how to turn it off."
    @preparation.save
  end

  def id_water_shutoff
    new_preparation
    @preparation.instructions = "Identify location of water shutoff and how to turn it off."
    @preparation.save
  end

  def id_electricity_shutoff
    new_preparation
    @preparation.instructions = "Identify location of electricity shutoff and how to turn it off."
    @preparation.save
  end

  def shutoff_tool
    new_preparation
    @preparation.instructions = "Have a tool handy (pipe, crescent or adjustable wrench) that can turn gas and water shutoff valves."
    @preparation.save
  end

  def shutoff_tool
    new_preparation
    @preparation.instructions = "Have a fire extinguisher handy."
    @preparation.save
  end

  def flam_liquids_outside
    new_preparation
    @preparation.instructions = "Move flammable liquids (painting or cleaning products) outside to a garage, storage shed or deck."
    @preparation.save
  end

  # Checks that apply only to house dwellers
  def flexible_utility_pipes
    new_preparation
    @preparation.instructions = "Install flexible utility pipes to avoid gas or water leaks."
    @preparation.save
  end

  def anchor_house_to_foundation
    new_preparation
    @preparation.instructions = "Make sure your home is securely anchored to its foundation"
    @preparation.save
  end
end
