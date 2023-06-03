class ReviewsController < ApplicationController
  def show
    @collection = Review.find(params[:id])
  end

  private

  def included_collections
    [:profile, :book]
  end

  def resource_path
    review_path
  end

  def resources_path
    reviews_path
  end

  def edit_resource_path
    edit_review_path
  end
end
