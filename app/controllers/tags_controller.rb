class TagsController < ApplicationController
  def create
    object = Tag.new
    object.update permitted_params
  end

  def destroy
    object = Tag.find(params[:id])
    object.delete
  end
end
