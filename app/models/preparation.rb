class Preparation < ActiveRecord::Base
  # validates_presence_of :user_id
  # validates :user_id, :uniqueness => { :scope => [:question_id] }

  belongs_to :prep, polymorphic: true
  belongs_to :question

  attr_accessor :user_id, :home_id

  def initialize(user_id, home_id)
    @user_id = user_id
    @home_id = home_id
  end
end
