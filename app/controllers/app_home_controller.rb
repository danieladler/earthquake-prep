class AppHomeController < ApplicationController

  def index
    @landing = true
    @todo = Todo.new(current_user.id)
  end

end
