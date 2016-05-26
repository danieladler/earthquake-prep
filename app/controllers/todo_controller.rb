class TodoController < ApplicationController

  def index
    @todo = Todo.new(current_user.id)
  end

  def preps
    @preps = Preparation.where(user_id: current_user.id).order(:prep_type, completed: :asc)
    render :json => @preps , :include => :question
  end

  def single_prep
    @prep = Preparation.where(user_id: current_user.id, id: params[:id])
    render :json => @prep
  end

  def update_prep
    @prep = Preparation.find(params[:prep][:id])
    @prep.completed = params[:prep][:completed]
    @prep.notes = params[:prep][:notes]
    # update other attributes of pre (notes/instructions() later when it's
    # clearer how this info will be displayed on Plan view
    if @prep.save
      render json: @prep, status: 201
    else
      render json: @prep.errors, status: 400
    end
  end

  def delete_prep
    @prep = Preparation.find(params[:id])
    render :json => @preps , :include => :question if @prep.destroy
  end

  def dash
    @arr = [].push(Todo.new(current_user.id))
    render json: @arr
  end
end
