module ProfilesHelper
  def favorite_check(favorite_profile, current_user)
    profile = Profile.find_by(user_id: current_user.id)
    relation = Favorite.where(profile_id: profile.id, favorite_profile_id: favorite_profile.id).first

    return false if relation.nil?

    profile.favorites.ids.include?(relation.id)
  end
end
