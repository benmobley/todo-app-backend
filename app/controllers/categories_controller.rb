class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    render :index
  end

  def show
    @category = Category.find_by(id: params[:id])
    render :show
  end

  def create
    @category = Category.create(
      name: params[:name],
    )
    render :show
  end

  def update
    @category = Category.find_by(id: params[:id])
    @category.update(
      name: params[:name] || @category.name,
    )
    render :show
  end
end
