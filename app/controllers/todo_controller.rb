class TodoController < ApplicationController

  def index
    @todo = Todo.new(current_user.id)
  end

  def preps
    @preps = Preparation.where(user_id: current_user.id).order(:prep_type, completed: :asc)
    render :json => @preps , :include => :question
  end

  def update_prep
    @prep = Preparation.find(params[:prep][:id])
    @prep.completed = params[:prep][:completed]
    # update other attributes of pre (notes/instructions() later when it's
    # clearer how this info will be displayed on Plan view
    if @prep.save
      render json: @prep, status: 201
    else
      render json: @prep.errors, status: 400
    end
  end

  def dash
    # render json: Todo.new(current_user.id)

    @arr = [].push(Todo.new(current_user.id))
    render json: @arr
  end
end
