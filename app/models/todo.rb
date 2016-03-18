class Todo
  include ActiveModel::Model
  include ActiveModel::Validations

  attr_accessor :user_id

  def initialize(user_id)
    @user_id = user_id
  end

  def current_user
    User.find(self.user_id)
  end

  def home_prep_completion
    @completed = self.current_user.home_preparations.where(completed?: true).count.to_f
    @total = self.current_user.home_preparations.count.to_f
    return @completed/@total
  end

end
