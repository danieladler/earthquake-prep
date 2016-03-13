class User < ActiveRecord::Base
  has_many :homes
  has_many :gears
  has_many :locations
  has_many :dependents
  has_many :contacts

  # polymorphic association-accessible Preparations by prep_type
  has_many :home_preparations, through: :homes, source: :preparations
  has_many :gear_preparations, through: :gears, source: :preparations
  has_many :location_preparations, through: :location, source: :preparations
  has_many :dependent_preparations, through: :dependents, source: :preparations
  has_many :contact_preparations, through: :contacts, source: :preparations

  validates :email, presence: true, uniqueness:true
  validates :email, format: {with: /@/}
end
