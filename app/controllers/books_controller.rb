class BooksController < ApplicationController
  def show
    @collection = Book.find(params[:id])
  end

  private

  def included_collections
    [:author]
  end

  def resource_path
    book_path
  end

  def resources_path
    books_path
  end

  def edit_resource_path
    edit_book_path
  end
end
