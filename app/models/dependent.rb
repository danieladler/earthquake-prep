class Dependent < ActiveRecord::Base
  belongs_to :user
  has_many :preparations, as: :prep
  validates_presence_of :user_id
  validates_presence_of :year_of_birth
  validates :name, :uniqueness => { :scope => [:user_id] }

  def update_db_values(params)
    self.human = params[:human]
    self.name  = params[:dep_name]
    self.year_of_birth = (Time.now.year - params[:dep_age].to_i)
  end
end
