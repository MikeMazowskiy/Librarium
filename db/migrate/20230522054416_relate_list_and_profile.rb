class RelateListAndProfile < ActiveRecord::Migration[7.0]
  def change
    add_reference :lists, :profile, foreign_key: true, type: :uuid
  end
end
