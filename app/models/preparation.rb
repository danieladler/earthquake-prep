class Preparation < ActiveRecord::Base
  validates_presence_of :user_id
  validates :user_id, :uniqueness => { :scope => [:question_id] }
  validates_presence_of :question_id

  belongs_to :prep, polymorphic: true
  belongs_to :question
end
