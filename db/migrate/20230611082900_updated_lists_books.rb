class UpdatedListsBooks < ActiveRecord::Migration[7.0]
  def change
    drop_table :lists_books

    create_table :lists_books, id: :uuid do |t|
      t.references :book, foreign_key: true, null: false, type: :uuid
      t.references :list, foreign_key: true, null: false, type: :uuid

      t.timestamps
    end
  end
end
