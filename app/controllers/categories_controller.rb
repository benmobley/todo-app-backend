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
    @category.find_by(id: params[:id])
    if current_user.id == @category.user_id
      @category.destroy
      render json: { message: "sucessfully destroyed" }
    else
      render json: { message: "Category does not exist for current user" }
    end
  end
end
