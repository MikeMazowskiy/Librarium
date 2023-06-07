class AddProfileToComment < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :profile, foreign_key: true, type: :uuid, null: false
  end
end
