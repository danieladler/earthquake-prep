class Location < ActiveRecord::Base
  belongs_to :user
  has_many :preparations, as: :prep
end
