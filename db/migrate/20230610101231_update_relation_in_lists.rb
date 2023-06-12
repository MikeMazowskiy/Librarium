class UpdateRelationInLists < ActiveRecord::Migration[7.0]
  def change
    create_table :books_lists do |t|
      t.belongs_to :book, null: false, foreign_key: { on_delete: :cascade }, type: :uuid
      t.belongs_to :list, null: false, foreign_key: { on_delete: :cascade }, type: :uuid

      t.timestamps
    end

    remove_column :books, :list_id, type: :uuid
  end
end
