class CreateFavorites < ActiveRecord::Migration[7.0]
  def change
    create_table :favorites, id: :uuid do |t|
      t.references :profile, reference: :profile, type: :uuid
      t.references :favorite_profile, reference: :profile, type: :uuid

      t.timestamps
    end
  end
end
