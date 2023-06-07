class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def show
    @collection = Review.find(params[:id])
  end

  def create
    book = Book.find(params[:book_id])
    collection = book.reviews.new permitted_params
    collection.profile_id = Profile.find_by(user_id: current_user.id).id if user_signed_in?

    if collection.save
      redirect_to book_path(book)
    else
      redirect_to book_path(book), notice: "Something went wrong."
    end
  end

  def destroy
    collection = model_class.find(params[:id])
    book = collection.book
    if collection.destroy

      redirect_to book_path(book), notice: "#{class_name} was successfully deleted."
    else
      redirect_to resource_path, notice: "Something went wrong."
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
