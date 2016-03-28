class AppHomeController < ApplicationController
  def index
    @landing = true
    if current_user
      @todo = Todo.new(current_user.id)
      @landing = false
    end
  end
end
