class UsersController < ApplicationController
  def create
    collection = User.new
    collection.update permitted_params
  end

  def destroy
    collection = User.find(params[:id])
    collection.delete
  end
end
