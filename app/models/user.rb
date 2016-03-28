class User < ActiveRecord::Base
  has_many :homes
  has_many :gears
  has_many :locations
  has_many :dependents
  has_many :contacts

  # polymorphic association-accessible Preparations by prep_type
  # has_many :home_preparations, through: :homes, source: :preparations
  # has_many :gear_preparations, through: :gears, source: :preparations
  # has_many :location_preparations, through: :location, source: :preparations
  # has_many :dependent_preparations, through: :dependents, source: :preparations
  # has_many :contact_preparations, through: :contacts, source: :preparations

  validates :email, presence: true, uniqueness:true
  validates :email, format: {with: /@/}
  validates :username, presence: true, uniqueness:true
  has_secure_password

  def no_human_dependents
    self.dependents.where(human: true).count == 0 ? true : false
  end

  def no_pet_dependents
    self.dependents.where(human: false).count == 0 ? true : false
  end

  def all_humans
    self.dependents.where(human: true)
  end

  def all_pets
    self.dependents.where(human: false)
  end

  def home_preparations
    Preparation.where(prep_type: "Home", user_id: self.id)
  end

  def contact_preparations
    Preparation.where(prep_type: "Contact", user_id: self.id)
  end

  def dependent_preparations
    Preparation.where(prep_type: "Dependent", user_id: self.id)
  end

  def gear_preparations
    Preparation.where(prep_type: "Gear", user_id: self.id)
  end
end
