class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews, id: :uuid do |t|
      t.text :text, presence: true
      t.references :profile, foreign_key: true, type: :uuid
      t.references :book, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
