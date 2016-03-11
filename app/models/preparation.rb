class Preparation < ActiveRecord::Base
  belongs_to :prep, polymorphic: true
end
