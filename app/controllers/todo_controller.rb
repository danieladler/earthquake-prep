class TodoController < ApplicationController

  def index
    @todo = Todo.new(current_user.id)
  end
end
