class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def show
    @object = Review.find(params[:id])
  end

  def create
    book = Book.find(params[:book_id])
    object = book.reviews.new permitted_params
    object.profile_id = Profile.find_by(user_id: current_user.id).id if user_signed_in?

    if object.save
      redirect_to book_path(book)
    else
      redirect_to book_path(book), flash[:notice] = "Something went wrong."
    end
  end

  def destroy
    object = model_class.find(params[:id])
    book = object.book
    if object.destroy

      redirect_to book_path(book), flash[:notice] = "#{class_name} was successfully deleted."
    else
      redirect_to resource_path, flash[:notice] = "Something went wrong."
    end
  end

  private

  def included_collections
    [:profile, :book]
  end

  def resource_path
    review_path
  end

  def edit_resource_path
    edit_review_path
  end
end
