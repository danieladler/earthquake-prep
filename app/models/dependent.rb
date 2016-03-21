class Dependent < ActiveRecord::Base
  belongs_to :user
  has_many :preparations, as: :prep

  def update_db_values(params)
    self.human = params[:human]
    self.name  = params[:dep_name]
    self.year_of_birth = (Time.now.year - params[:dep_age].to_i)
  end
end
