class CategoriesController < ApplicationController
  before_action :authenticate_user

  def index
    @categories = current_user.categories
    render :index
  end

  def show
    @category = Category.find_by(id: params[:id])
    if current_user.id == @category.user_id
      render :show
    else
      render json: { message: "Category does not exist for current user" }
    end
  end

  def create
    @category = Category.create(
      name: params[:name],
      user_id: current_user.id,
    )
    render :show
  end

  def update
    @category = Category.find_by(id: params[:id])
    if current_user.id == @category.user_id
      @category.update(
        name: params[:name] || @category.name,
      )
      render :show
    else
      render json: { message: "Category does not exist for current user" }
    end
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.todos.any?
      render json: { error: "Cannot delete category with todos" }, status: :unprocessable_entity
    else
      @category.destroy
      render json: { message: "Category deleted successfully" }
    end
  rescue => e
    render json: { error: e.message }, status: :internal_server_error
  end
end
