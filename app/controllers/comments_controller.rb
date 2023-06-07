class CommentsController < ApplicationController
  def show
    @collection = Comment.find(params[:id])
  end

  def create
    review = Review.find(params[:review_id])
    collection = review.comments.new permitted_params
    collection.profile_id = Profile.find_by(user_id: current_user.id).id if user_signed_in?

    if collection.save
      redirect_to review_path(review)
    else
      redirect_to review_path(review), notice: "Something went wrong."
    end
  end

  def destroy
    collection = model_class.find(params[:id])
    review = collection.review
    if collection.destroy

      redirect_to review_path(review), notice: "#{class_name} was successfully deleted."
    else
      redirect_to resource_path, notice: "Something went wrong."
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
