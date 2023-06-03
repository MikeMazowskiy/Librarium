class ProfilesController < AuthenticatedController
  before_action :load_profile, only: %i[edit update destroy authenticated_user?]
  before_action :authenticated_user?, only: %i[edit update destroy]

  def show
    if params[:id]
      @collection = Profile.find(params[:id])
    else
      @collection = current_user.profile
    end
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

  def load_profile
    @collection = Profile.find(params[:id])
  end
end
