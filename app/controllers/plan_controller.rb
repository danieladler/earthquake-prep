class PlanController < ApplicationController

  def index
    @ready_gear_items = current_user.gear_preparations.where(completed: true)
  end
end
