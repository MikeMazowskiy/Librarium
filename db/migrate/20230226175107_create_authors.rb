class CreateAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :authors, id: :uuid do |t|
      t.string :firstname
      t.string :lastname

      t.timestamps
    end

    add_reference :books, :author, foreign_key: true, type: :uuid
  end
end
