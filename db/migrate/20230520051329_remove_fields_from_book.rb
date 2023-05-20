class RemoveFieldsFromBook < ActiveRecord::Migration[7.0]
  def change
    remove_column :books, :pages, :integer
    add_column :books, :description, :string
  end
end
