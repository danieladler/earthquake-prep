class Dependent < ActiveRecord::Base
  belongs_to :user
  has_many :preparations, as: :prep
  validates_presence_of :user_id
  validates :name, :uniqueness => { :scope => [:user_id] }

  def update_db_values(params)
    self.human = params[:human]
    self.name  = params[:dep_name]
  end
end
