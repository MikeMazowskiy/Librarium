class AuthorsController < ApplicationController
  private

  def resource_path
    author_path
  end

  def resources_path
    authors_path
  end

  def edit_resource_path
    edit_author_path
  end
end
