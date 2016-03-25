class TodoController < ApplicationController

  def index
    @todo = Todo.new(current_user.id)
  end

  def preps
    @preps = Preparation.where(user_id: current_user.id)
    render :json => @preps , :include => :question
  end
end
