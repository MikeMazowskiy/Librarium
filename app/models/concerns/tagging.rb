module Tagging
  extend ActiveSupport::Concern

  included do
    has_many :taggable_tags, as: :taggable, dependent: :destroy
    has_many :tags, through: :taggable_tags
  end

  def create_tags
    extract_name_tags.each do |name|
      tag = Tag.find_or_create_by(name: name)
      self.tags << tag
    end
  end

  def extract_name_tags
    if self.class.is_a?(Book)
      description.to_s.scan(/#\w+/).map{|name| name.gsub("#", "")}
    else
      text.to_s.scan(/#\w+/).map{|name| name.gsub("#", "")}
    end
  end
end
