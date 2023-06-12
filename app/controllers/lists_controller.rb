class ListsController < ApplicationController

  def index
    @collection = Profile.find_by(user_id: current_user.id).lists
  end

  def show
    @object = List.find(params[:id])
  end

  def update
    object = model_class.find(params[:id])
    object.books << Book.find(permitted_params[:book_ids])

    if object.save
      redirect_to resource_path, :flash => { :notice => "#{class_name} was successfully updated." }
    else
      redirect_to edit_resource_path, :flash => { :error => "Something went wrong." }
    end
  end

  private

  def included_collections
    [:books]
  end

  def resource_path
    list_path
  end

  def resources_path
    lists_path
  end

  def permitted_params
    params.require(class_name.downcase.to_sym).permit(class_attributes.push(:book_ids))
  end
end
