class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments, id: :uuid do |t|
      t.text :text, presence: true
      t.references :review, foreign_key: true, null: false, type: :uuid

      t.timestamps
    end
  end
end
