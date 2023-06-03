class ListsController < ApplicationController
  def show
    @collection = List.find(params[:id])
  end

  private

  def included_collections
    [:book]
  end

  def resource_path
    list_path
  end

  def resources_path
    lists_path
  end
end
