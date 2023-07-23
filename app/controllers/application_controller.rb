class ApplicationController < ActionController::Base
  include Pundit

  LIST = "List".freeze

  rescue_from Pundit::NotAuthorizedError, with: :not_allowed_to_update

  def index
    if %w[User, Comment].include?(class_name)
      raise "Not implemented error"
    else
      @collection = model_class.includes(included_collections).all
    end
  end

  def new
    if class_name == LIST
      raise "Not implemented error"
    else
      @object = model_class.new
    end
  end

  def show
    raise "Not implemented error"
  end

  def edit
    if %w[User Tag].include?(class_name)
      raise "Not implemented error"
    else
      @object = model_class.find(params[:id])
    end
  end

  def create
    if class_name == LIST
      raise "Not implemented error"
    else
      object = model_class.new permitted_params

      if object.save
        redirect_to resources_path
      else
        redirect_to resources_path
      end
    end
  end

  def update
    if %w[User Tag].include?(class_name)
      raise "Not implemented error"
    else
      object = model_class.find(params[:id])
    end

    if object.update permitted_params
      redirect_to resource_path, flash[:notice] = "#{class_name} was successfully updated."
    else
      redirect_to edit_resource_path, flash[:error] = "Something went wrong."
    end
  end

  def destroy
    if class_name == LIST
      raise "Not implemented error"
    else
      object = model_class.find(params[:id])

      if object.destroy
        redirect_to resources_path, flash[:notice] = "#{class_name} was successfully destroyed."
      else
        redirect_to edit_resource_path, flash[:error] = "Something went wrong."
      end
    end
  end

  private

  def permitted_params
    params.require(class_name.downcase.to_sym).permit(class_attributes)
  end

  def class_attributes
    model_class
      .attribute_names
      .map { _1.to_sym unless _1 ==  "created_at" || _1 ==  "updated_at" }
      .compact_blank
  end

  def included_collections
    []
  end

  def resource_path
    raise "Not implemented error"
  end

  def resources_path
    raise "Not implemented error"
  end

  def edit_resource_path
    raise "Not implemented error"
  end
  
  def model_class
    controller_path.classify.constantize
  end

  def class_name
    controller_path.classify
  end

  def not_allowed_to_update
    flash[:warning] = 'You are not authorized to perform this action.'
    redirect_to(request.referer || profile_path)
  end
end
