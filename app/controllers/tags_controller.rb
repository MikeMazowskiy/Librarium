class TagsController < ApplicationController
  def create
    collection = Tag.new
    collection.update permitted_params
  end

  def destroy
    collection = Tag.find(params[:id])
    collection.delete
  end
end
