class CreateTags < ActiveRecord::Migration[7.0]
  def change
    create_table :tags, id: :uuid do |t|
      t.string :name

      t.timestamps
    end

    create_join_table :tags, :books, column_options: { null: false, type: :uuid }
  end
end
