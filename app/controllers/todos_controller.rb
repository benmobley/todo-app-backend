class TodosController < ApplicationController
  def index
    render json: { message: "this should work" }
  end
end
