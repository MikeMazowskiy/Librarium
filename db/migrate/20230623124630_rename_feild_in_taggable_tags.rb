class RenameFeildInTaggableTags < ActiveRecord::Migration[7.0]
  def change
    rename_column :taggable_tags, :tags_id, :tag_id
  end
end
