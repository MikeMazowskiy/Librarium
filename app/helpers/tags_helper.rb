module TagsHelper
  def render_partial(class_name)
    return render partial: 'tags/books', collection: @collection if class_name == "Book"

    if class_name == "Comment"
      render partial: 'tags/comments', collection: @collection
    else
      render partial: 'tags/reviews',  collection: @collection
    end
  end
end
