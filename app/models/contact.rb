class Contact < ActiveRecord::Base
  belongs_to :user
  has_many :preparations, as: :prep
  validates_presence_of :user_id
  validates_presence_of :email
  validates :email, format: {with: /@/}
  validates_presence_of :phone
  validates :name, :uniqueness => { :scope => [:user_id] }

  def update_db_values(params)
    self.name  = params[:con_name]
    self.email = params[:con_email]
    self.phone = params[:con_phone]
  end
end
