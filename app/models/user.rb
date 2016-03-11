class User < ActiveRecord::Base
  has_many :homes
  has_many :gears
  has_many :locations
end
