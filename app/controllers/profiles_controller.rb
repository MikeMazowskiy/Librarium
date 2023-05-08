class ProfilesController < ApplicationController
  before_action :authenticated_user?, only: %i[edit update destroy]

  def show
    @collection = Profile.find(params[:id])
  end

  private

  def resource_path
    profile_path
  end

  def resources_path
    profiles_path
  end

  def edit_resource_path
    edit_profile_path
  end

  def authenticated_user?
    authorize @collection
  end
end
