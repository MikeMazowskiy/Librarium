class CreateLists < ActiveRecord::Migration[7.0]
  def change
    create_table :lists, id: :uuid do |t|
      t.string :name, presence: true, null: false

      t.timestamps
    end
  end

  add_reference :books, :list, foreign_key: true, type: :uuid
end
