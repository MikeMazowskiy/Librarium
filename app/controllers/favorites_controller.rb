class FavoritesController < ApplicationController
  def index
    current_profile = Profile.find(params[:profile_id])
    @collections = current_profile.favorites
  end

  def create
    favorite_profile = Profile.find(params[:favorite_profile_id])
    profile          = Profile.find_by(user_id: current_user.id)
    object           = Favorite.new(profile: profile, favorite_profile: favorite_profile)

    if object.save
      redirect_to resources_path
    else
      render json: { success: false, errors: object.errors.full_messages }
    end
  end

  def destroy
    favorite_profile = Profile.find(params[:favorite_profile_id])
    profile          = Profile.find_by(user_id: current_user.id)
    object           = Favorite.where(profile_id: profile.id, favorite_profile_id: favorite_profile.id).first

    if object.destroy
      redirect_to resources_path, flash[:notice] = "Successfully deleted from favorite"
    else
      redirect_to edit_resource_path, flash[:error] = "Something went wrong"
    end
  end

  private

  def resources_path
    favorites_path
  end
end
