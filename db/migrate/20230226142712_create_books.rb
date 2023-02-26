class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books, id: :uuid do |t|
      t.string :title, presence: true, null: false
      t.string :genre, presence: true, null: false
      t.integer :pages, presence: true, null: false
      t.integer :year_of_publishing, presence: true, null: false

      t.timestamps
    end

    create_table :books_profiles do |t|
      t.references :profile, foreign_key: { on_delete: :cascade }, null: false,  type: :uuid
      t.references :book, null: false, foreign_key: { on_delete: :cascade }, type: :uuid

      t.timestamps
    end
  end
end
