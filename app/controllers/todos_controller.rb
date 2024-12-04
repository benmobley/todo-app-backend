class TodosController < ApplicationController
  before_action :authenticate_user

  def index
    @todos = current_user.todos
    render :index
  end

  def create
    @todo = Todo.create(
      user_id: current_user.id,
      category_id: params[:category_id],
      title: params[:title],
      description: params[:description],
      deadline: params[:deadline],
      completed: params[:completed],
    )
    render :show
  end

  def show
    @todo = Todo.find_by(id: params[:id])
    if current_user.id == @todo.user_id
      render :show
    else
      render json: { message: "Todo doesn't exist for current user" }
    end
  end

  def update
    @todo = Todo.find_by(id: params[:id])
    if current_user.id == @todo.user_id
      @todo.update(
        category_id: params[:category_id] || @todo.category_id,
        title: params[:title] || @todo.title,
        description: params[:description] || @todo.description,
        deadline: params[:deadline] || @todo.deadline,
        completed: params[:completed] || @todo.completed,
      )
      render :show
    else
      render json: { message: "Todo doesn't exist for current user" }
    end
  end

  def destroy
    @todo = Todo.find_by(id: params[:id])
    if current_user.id == @todo.user_id
      @todo.destroy
      render json: { message: "sucessfully destroyed" }
    else
      render json: { message: "Todo doesn't exist for current user" }
    end
  end
end
