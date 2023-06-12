class Favorite < ApplicationRecord
  belongs_to :profile, foreign_key: :profile_id, class_name: "Profile"
  belongs_to :favorite_profile, foreign_key: :favorite_profile_id, class_name: "Profile"
end
