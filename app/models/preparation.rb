class Preparation < ActiveRecord::Base
  validates_presence_of :user_id
  validates :instructions, :uniqueness => { :scope => [:prep_type, :prep_id] }

  belongs_to :prep, polymorphic: true
end
