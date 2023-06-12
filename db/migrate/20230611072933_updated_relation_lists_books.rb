class UpdatedRelationListsBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :lists_books, id: false do |t|
      t.references :book, foreign_key: true, null: false, type: :uuid
      t.references :list, foreign_key: true, null: false, type: :uuid

      t.timestamps
    end

    add_index :lists_books, [:book_id, :list_id], unique: true

    drop_table :books_lists
  end
end
