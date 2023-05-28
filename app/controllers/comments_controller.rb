class CommentsController < ApplicationController
  def show
    @collection = Comment.find(params[:id])
  end

  private

  def included_collections
    [:review]
  end

  def resource_path
    comment_path
  end

  def resources_path
    comments_path
  end

  def edit_resource_path
    edit_comment_path
  end
end
