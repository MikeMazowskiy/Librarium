class CommentsController < ApplicationController
  def show
    @object = Comment.find(params[:id])
  end

  def create
    review = Review.find(params[:review_id])
    object = review.comments.new permitted_params
    object.profile_id = Profile.find_by(user_id: current_user.id).id if user_signed_in?

    if object.save
      redirect_to review_path(review)
    else
      redirect_to review_path(review), flash[:notice] = "Something went wrong."
    end
  end

  def destroy
    object = model_class.find(params[:id])
    review = object.review
    if object.destroy

      redirect_to review_path(review), flash[:notice] = "#{class_name} was successfully deleted."
    else
      redirect_to resource_path, flash[:notice] = "Something went wrong."
    end
  end

  private

  def included_collections
    [:review]
  end

  def resource_path
    comment_path
  end

  def edit_resource_path
    edit_comment_path
  end
end
