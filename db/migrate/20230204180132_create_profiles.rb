class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles, id: :uuid do |t|
      t.string :nickname
      t.string :firstname
      t.string :lastname
      t.integer :age
      t.references :user

      t.timestamps
    end
  end
end
