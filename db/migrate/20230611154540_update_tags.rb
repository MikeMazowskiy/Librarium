class UpdateTags < ActiveRecord::Migration[7.0]
  def change
    drop_join_table :tags, :books, column_options: { null: false, type: :uuid }

    create_table :taggable_tags, id: :uuid do |t|
      t.references :taggable, polymorphic: true, type: :uuid
      t.references :tags, type: :uuid

      t.timestamps
    end

  end
end
